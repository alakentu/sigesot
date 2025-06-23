<?php

declare(strict_types=1);

use Config\Helpdesk;
use App\Models\Ticket;

if (!function_exists('user_tickets_count')) {
    /**
     * Obtiene el número de tickets activos del usuario actual
     * @return int
     */
    function user_tickets_count(): int
    {
        try {
            $ticket     = new Ticket();
            $session    = \Config\Services::session();
            $userId     = (int) $session->get('user_id') ?? null;

            if (!$userId) return 0;

            return $ticket->countActiveTickets($userId);
        } catch (\Exception $e) {
            log_message('error', '[Tickets Helper] Error counting tickets: ' . $e->getMessage());
            return 0;
        }
    }
}

if (!function_exists('tickets_available')) {
    /**
     * Verifica si el usuario puede crear más tickets
     * @return bool
     */

    function tickets_available(): bool
    {
        $config = new Helpdesk();

        return user_tickets_count() < $config->max_tickets_per_user;
    }
}

if (!function_exists('ticket_badge_status')) {
    /**
     * Devuelve el HTML del badge de estado para un ticket
     * @param string $status
     * @return string
     */
    function ticket_badge_status(string $status): string
    {
        $statusClasses = [
            'open' => 'bg-success',
            'pending' => 'bg-warning text-dark',
            'closed' => 'bg-secondary',
            'escalated' => 'bg-danger'
        ];

        $class = $statusClasses[strtolower($status)] ?? 'bg-info';

        return '<span class="badge ' . $class . '">' . lang('Tickets.status_' . $status) . '</span>';
    }
}

if (!function_exists('ticket_priority_icon')) {
    /**
     * Devuelve el icono de prioridad para un ticket
     * @param string $priority
     * @return string
     */
    function ticket_priority_icon(string $priority): string
    {
        $icons = [
            'low' => 'bi-arrow-down-circle text-info',
            'medium' => 'bi-arrow-right-circle text-primary',
            'high' => 'bi-arrow-up-circle text-danger'
        ];

        return '<i class="bi ' . ($icons[strtolower($priority)] ?? 'bi-question-circle') . '"></i>';
    }
}

if (!function_exists('format_ticket_date')) {
    /**
     * Formatea la fecha del ticket según configuración
     * @param string $date
     * @return string
     */
    function format_ticket_date(string $date): string
    {
        $datetime = \CodeIgniter\I18n\Time::parse($date);
        return $datetime->humanize() ?? $date;
    }
}

if (!function_exists('ticket_notification_bell')) {
    /**
     * Genera el HTML para la campana de notificaciones
     * @param int $unreadCount
     * @return string
     */
    function ticket_notification_bell(int $unreadCount = 0): string
    {
        $badge = $unreadCount > 0
            ? '<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">' . $unreadCount . '</span>'
            : '';

        return '<div class="position-relative">
            <i class="bi bi-bell-fill fs-5"></i>
            ' . $badge . '
        </div>';
    }
}
