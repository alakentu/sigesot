<?php

namespace App\Services;

use CodeIgniter\Config\BaseService;
use App\Models\Notification;
use App\Models\Ticket;
use App\Models\Users;

class NotificationService extends BaseService
{
    protected $notification;
    protected $ticket;
    protected $users;
    protected $session;
    protected $cache;

    public function __construct()
    {
        $this->notification = new Notification;
        $this->ticket = new Ticket;
        $this->users = new Users;
        $this->session = \Config\Services::session();
        $this->cache = \Config\Services::cache();
    }

    /**
     * Notifica sobre un nuevo ticket a los técnicos
     */
    public function notifyNewTicket(int $ticketId, array $technicians, string $priority)
    {
        try {
            $ticket = $this->ticket->find($ticketId);
            if (!$ticket) {
                throw new \Exception("Ticket {$ticketId} no encontrado");
            }

            // 1. Insertar notificación en la base de datos (para el dropdown)
            $notifications = array_map(function ($tech) use ($ticketId, $ticket, $priority) {
                return [
                    'user_id'      => $tech['id'],
                    'type'        => 'new_ticket',
                    'related_id'  => $ticketId,
                    'title'       => 'Nuevo Ticket (' . strtoupper($priority) . ')',
                    'message'    => "Ticket #{$ticketId}: {$ticket['title']}",
                    'is_read'     => 0,
                    'created_at'  => date('Y-m-d H:i:s')
                ];
            }, $technicians);

            $this->notification->insertBatch($notifications);

            // 2. Notificación en tiempo real (WebSockets/Pusher)
            $this->pushRealTimeNotification($technicians, [
                'type'       => 'new_ticket',
                'ticket_id'  => $ticketId,
                'priority'   => $priority,
                'message'   => "Nuevo ticket {$priority} asignado",
                'play_sound' => true,
                'sound_file' => "{$priority}.mp3" // Ejemplo: alta.mp3, media.mp3, baja.mp3
            ]);

            return true;
        } catch (\Exception $e) {
            log_message('error', "[NotificationService] Error en ticket #{$ticketId}: " . $e->getMessage());
            return false;
        }
    }

    /**
     * Notifica sobre un cambio en el ticket
     */
    public function notifyTicketUpdate(int $ticketId, int $userId, string $message)
    {
        // 1. Guardar notificación
        $this->notification->insert([
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
    }

    /**
     * Envía notificaciones en tiempo real a los usuarios especificados
     *
     * @param array $userIds IDs de los usuarios que recibirán la notificación
     * @param array $data Información adicional para la notificación
     *                    - type: tipo de notificación (new_ticket, ticket_update, etc.)
     *                    - ticket_id: ID del ticket relacionado
     *                    - priority: prioridad del ticket (alta, media, baja)
     *                    - message: mensaje adicional para la notificación
     *                    - play_sound: booleano para reproducir un sonido al recibir la notificación
     *                    - sound_file: archivo de sonido para reproducir
     *                    - metadata: datos adicionales para la notificación
     */
    protected function pushRealTimeNotification(array $userIds, array $data)
    {
        $soundConfig = [
            'alta' => 'alarm.mp3',
            'media' => 'alert.mp3',
            'baja' => 'notify.mp3'
        ];

        foreach ($userIds as $userId) {
            $key = "realtime_notifications_{$userId}";
            $notifications = $this->cache->get($key) ?: [];

            $notification = [
                'type' => $data['type'] ?? 'new_ticket',
                'ticket_id' => $data['ticket_id'],
                'priority' => $data['priority'] ?? 'baja',
                'message' => $data['message'] ?? 'Nueva notificación',
                'play_sound' => $data['play_sound'] ?? false,
                'sound_file' => $soundConfig[$data['priority'] ?? 'baja'],
                'created_at' => time(),
                'related_id' => $data['ticket_id'] // Añadido para consistencia
            ];

            // Clave única para evitar duplicados
            $uniqueKey = "{$notification['ticket_id']}_{$notification['type']}_{$userId}";
            $notifications[$uniqueKey] = $notification;

            $this->cache->save($key, array_slice($notifications, 0, 50), 3600);
        }
    }

    /**
     * Recupera una lista de notificaciones no leídas de un usuario específico.
     *
     * Este método combina las notificaciones no leídas almacenadas en la base
     * de datos con las notificaciones en tiempo real extraídas de la caché,
     * lo que proporciona una lista completa de notificaciones no leídas. Tras
     * recuperar las notificaciones en tiempo real de la caché, se eliminan.
     *
     * @param int $userId El ID del usuario cuyas notificaciones no leídas
     *                      se recuperarán.
     * @return array Una matriz que contiene las notificaciones no leídas,
     *                      tanto en tiempo real como de la base de datos,
     *                      ordenadas por fecha de creación en orden descendente.
     */
    public function getUnreadNotifications(int $userId): array
    {
        // 1. Notificaciones de la base de datos (con formato unificado)
        $dbNotifications = array_map(function ($notif) {
            return [
                'id' => $notif['id'],
                'type' => $notif['type'],
                'message' => $notif['message'] ?? $notif['title'],
                'priority' => $notif['priority'] ?? 'media',
                'play_sound' => ($notif['type'] === 'new_ticket'),
                'link' => $this->getNotificationLink($notif),
                'created_at' => $notif['created_at'],
                'is_read' => $notif['is_read'] ?? 0,
                'related_id' => $notif['related_id'] // Añadido para has_unread
            ];
        }, $this->notification->getUnreadNotifications($userId));

        // 2. Notificaciones en tiempo real (de caché, con clave única)
        $key = "realtime_notifications_{$userId}";
        $realtimeNotifications = $this->cache->get($key) ?: [];
        $this->cache->delete($key);

        // 3. Eliminar duplicados y limitar a 50
        $uniqueNotifications = [];
        foreach (array_merge($realtimeNotifications, $dbNotifications) as $notif) {
            $uniqueKey = "{$notif['related_id']}_{$notif['type']}_{$userId}";
            if (!isset($uniqueNotifications[$uniqueKey])) {
                $uniqueNotifications[$uniqueKey] = $notif;
            }
        }

        return array_values(array_slice($uniqueNotifications, 0, 50));
    }

    /**
     * Marca las notificaciones especificadas como leídas.
     *
     * @param array $notificationIds Un array de IDs de notificaciones para marcar como leídas.
     *
     * Este método actualiza el estado 'is_read' a 1 y establece la marca de tiempo 'read_at'
     * con la fecha y hora actuales de las notificaciones especificadas en la base de datos.
     */
    public function markAsRead(array $notificationIds)
    {
        if (!empty($notificationIds)) {
            $this->notification
                ->whereIn('id', $notificationIds)
                ->set(['is_read' => 1, 'read_at' => date('Y-m-d H:i:s')])
                ->update();
        }
    }

    private function getNotificationLink(array $notification): string
    {
        $routes = [
            'new_ticket' => "admin/tickets/details/{$notification['related_id']}",
            'ticket_update' => "admin/tickets/details/{$notification['related_id']}",
            'assignment' => "admin/tickets/details/{$notification['related_id']}#assignment"
        ];

        return base_url($routes[$notification['type']] ?? 'dashboard');
    }

    public function hasUnreadTicket(int $userId, int $ticketId): bool
    {
        $cacheKey = "unread_{$userId}_{$ticketId}";

        // Intentar obtener de caché
        $cachedResult = $this->cache->get($cacheKey);
        if ($cachedResult !== null) {
            return $cachedResult;
        }

        // Calcular y guardar en caché
        $result = $this->notification
            ->where('user_id', $userId)
            ->where('related_id', $ticketId)
            ->where('is_read', 0)
            ->countAllResults() > 0;

        $this->cache->save($cacheKey, $result, 300);
        return $result;
    }
}
