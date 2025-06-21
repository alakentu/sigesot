<?php

namespace App\Services;

use CodeIgniter\Config\BaseService;
use App\Models\Notification;

class NotificationService extends BaseService
{
    protected $notificationModel;
    protected $email;
    protected $session;

    public function __construct()
    {
        $this->notificationModel = new Notification;
        $this->email = \Config\Services::email();
        $this->session = \Config\Services::session();
    }

    /**
     * Notifica sobre un nuevo ticket a los técnicos
     */
    public function notifyNewTicket(int $ticketId, array $technicians)
    {
        // 1. Guardar notificación en base de datos
        $notifications = [];
        foreach ($technicians as $tech) {
            $notifications[] = [
                'user_id' => $tech['id'],
                'type' => 'new_ticket',
                'related_id' => $ticketId,
                'title' => 'Nuevo Ticket Disponible',
                'message' => 'Hay un nuevo ticket que requiere atención',
                'is_read' => 0,
                'created_at' => date('Y-m-d H:i:s')
            ];
        }

        if (!empty($notifications)) {
            $this->notificationModel->insertBatch($notifications);
        }

        // 2. Enviar notificaciones en tiempo real (para UI)
        $this->pushRealTimeNotification($technicians, [
            'type' => 'new_ticket',
            'ticket_id' => $ticketId,
            'message' => 'Nuevo ticket disponible'
        ]);

        // 3. Enviar emails
        $this->sendNewTicketEmails($ticketId, $technicians);
    }

    /**
     * Notifica sobre un cambio en el ticket
     */
    public function notifyTicketUpdate(int $ticketId, int $userId, string $message)
    {
        // 1. Guardar notificación
        $this->notificationModel->insert([
            'user_id' => $userId,
            'type' => 'ticket_update',
            'related_id' => $ticketId,
            'title' => 'Actualización de Ticket',
            'message' => $message,
            'is_read' => 0,
            'created_at' => date('Y-m-d H:i:s')
        ]);

        // 2. Notificación en tiempo real
        $this->pushRealTimeNotification([$userId], [
            'type' => 'ticket_update',
            'ticket_id' => $ticketId,
            'message' => $message
        ]);

        // 3. Enviar email
        $this->sendTicketUpdateEmail($ticketId, $userId, $message);
    }

    /**
     * Simula notificaciones en tiempo real sin WebSockets
     */
    protected function pushRealTimeNotification(array $userIds, array $data)
    {
        // Guardar en caché para ser recuperado por AJAX
        $cache = \Config\Services::cache();

        foreach ($userIds as $userId) {
            $key = "realtime_notifications_{$userId}";
            $notifications = $cache->get($key) ?: [];
            $notifications[] = $data;
            $cache->save($key, $notifications, 3600); // 1 hora de duración
        }
    }

    /**
     * Envía emails sobre nuevo ticket
     */
    protected function sendNewTicketEmails(int $ticketId, array $technicians)
    {
        $ticketModel = model('TicketModel');
        $ticket = $ticketModel->find($ticketId);
        $emailConfig = \Config\Services::email();

        foreach ($technicians as $tech) {
            $this->email->clear();
            $this->email->setFrom($emailConfig->fromEmail, $emailConfig->fromName);
            $this->email->setTo($tech['email']);
            $this->email->setSubject("Nuevo Ticket #{$ticketId} - {$ticket['title']}");

            $emailView = view('emails/new_ticket', [
                'ticket' => $ticket,
                'technician' => $tech
            ]);

            $this->email->setMessage($emailView);
            $this->email->send();
        }
    }

    /**
     * Envía email sobre actualización de ticket
     */
    protected function sendTicketUpdateEmail(int $ticketId, int $userId, string $message)
    {
        $ticketModel = model('TicketModel');
        $userModel = model('Users');

        $ticket = $ticketModel->find($ticketId);
        $user = $userModel->find($userId);

        $this->email->clear();
        $this->email->setTo($user['email']);
        $this->email->setSubject("Actualización en Ticket #{$ticketId}");

        $emailView = view('emails/ticket_update', [
            'ticket' => $ticket,
            'message' => $message,
            'user' => $user
        ]);

        $this->email->setMessage($emailView);
        $this->email->send();
    }

    /**
     * Obtiene notificaciones no leídas para un usuario
     */
    public function getUnreadNotifications(int $userId): array
    {
        // Notificaciones de la base de datos
        $dbNotifications = $this->notificationModel
            ->where('user_id', $userId)
            ->where('is_read', 0)
            ->orderBy('created_at', 'DESC')
            ->findAll();

        // Notificaciones en tiempo real (de caché)
        $cache = \Config\Services::cache();
        $key = "realtime_notifications_{$userId}";
        $realtimeNotifications = $cache->get($key) ?: [];
        $cache->delete($key);

        return array_merge($realtimeNotifications, $dbNotifications);
    }

    /**
     * Marca notificaciones como leídas
     */
    public function markAsRead(array $notificationIds)
    {
        if (!empty($notificationIds)) {
            $this->notificationModel
                ->whereIn('id', $notificationIds)
                ->set(['is_read' => 1, 'read_at' => date('Y-m-d H:i:s')])
                ->update();
        }
    }

    /**
     * Reproduce sonido de notificación
     */
    public function playNotificationSound()
    {
        $this->session->setFlashdata('play_sound', true);
    }
}
