<?php

namespace App\Controllers\Admin;

use App\Controllers\Admin\AdminController;

class Notifications extends AdminController
{
    public function index()
    {
        //
    }

    public function getUnread()
    {
        $userId = $this->session->get('user_id');
        if (!$userId) {
            return $this->response->setJSON([]);
        }

        $notifications = service('notifications')->getUnreadNotifications($userId);

        // Formatear para el frontend
        $formatted = array_map(function ($notif) {
            return [
                'id' => $notif['id'],
                'type' => $notif['type'],
                'message' => $notif['message'],
                'time' => timeAgo($notif['created_at']),
                'link' => $this->getNotificationLink($notif),
                'is_read' => $notif['is_read'] ?? 0
            ];
        }, $notifications);

        return $this->response->setJSON($formatted);
    }

    public function markAsRead()
    {
        $ids = $this->request->getPost('ids');
        if (!empty($ids)) {
            service('notifications')->markAsRead($ids);
        }
        return $this->response->setJSON(['status' => 'success']);
    }

    protected function getNotificationLink(array $notification): string
    {
        switch ($notification['type']) {
            case 'new_ticket':
            case 'ticket_update':
                return base_url("tickets/view/{$notification['related_id']}");
            default:
                return base_url('notifications');
        }
    }
}
