<?php

namespace App\Controllers\Admin;

use App\Controllers\Admin\AdminController;
use CodeIgniter\API\ResponseTrait;

class Tickets extends AdminController
{
    use ResponseTrait;

    /**
     * Muestra la lista de solicitudes de soporte.
     *
     * @param string $filter Opcional, parámetro de filtro:
     *                        - today: solicitudes abiertas hoy
     *                        - solved_today: solicitudes resueltas hoy
     *                        - open: solicitudes abiertas
     *                        - in_progress: solicitudes en progreso
     *                        - closed: solicitudes cerradas
     *
     * @return string|\CodeIgniter\HTTP\RedirectResponse
     */
    public function index()
    {
        if (!$this->auth->loggedIn()) {
            return redirect()->to(site_url());
        }

        // Obtiene parámetros de filtro
        $filter = $this->request->getGet('filter');

        $this->template->add_css_file('dataTables.bootstrap5,responsive.bootstrap,buttons.dataTables');
        $this->template->add_js_file('jquery.dataTables,dataTables.bootstrap5,dataTables.responsive,dataTables.buttons,buttons.print,buttons.html5,vfs_fonts,pdfmake,jszip,notifications,tickets');

        $userId = $this->auth->getUserId();
        $userGroups = $this->mauth->getUsersGroups($userId)->getResult();
        $groupNames = array_map(function ($group) {
            return $group->name;
        }, $userGroups);

        $this->data['page_title'] = 'Solicitudes de Soporte';

        $tickets = [];

        if (array_intersect(['admin', 'manager'], $groupNames)) {
            $tickets = $this->ticket->getAllTickets();
        } elseif (array_intersect(['technical'], $groupNames)) {
            $tickets = $this->ticket->getAssignedTickets($userId);
        } else {
            $tickets = $this->ticket->getUserTickets($userId);
        }

        // Aplicar filtros
        switch ($filter) {
            case 'today':
                $tickets = $this->ticket->select('*')->where('DATE(created_at)', date('Y-m-d'))->findAll();
                break;
            case 'solved_today':
                $tickets = $this->ticket->select('*')->where('DATE(closed_at)', date('Y-m-d'))->where('status', 'cerrado')->findAll();
                break;
            case 'open':
                $tickets = $this->ticket->select('*')->where('status', 'abierto')->findAll();
                break;
            case 'in_progress':
                $tickets = $this->ticket->select('*')->where('status', 'en_progreso')->findAll();
                break;
            case 'closed':
                $tickets = $this->ticket->select('*')->where('status', 'cerrado')->findAll();
                break;
            default:
                break;
        }

        foreach ($tickets as &$ticket) {
            $ticket['has_unread'] = $this->notifications->hasUnreadTicket($userId, $ticket['id']);
        }

        $this->data['tickets'] = $tickets;
        $this->data['ticketscreated'] = $this->ticket->select('created_at');
        $this->data['categories'] = $this->category->getActiveCategories();
        $this->data['userGroups'] = $userGroups;
        $this->data['currentFilter'] = $filter;

        // Datos para el dashboard
        $this->data['users'] = $this->auth->users()->result();
        $this->data['recentTickets'] = $this->ticket->getRecentTickets(5);
        $this->data['activeTicketsCount'] = $this->ticket->countActiveTickets($userId);
        $this->data['categories'] = $this->category->getActiveCategories();

        $this->data['helpdesk'] = $this->helpdesk;

        // Obtener estadísticas
        $this->data['ticketStats'] = [
            'total' => [
                'count' => $this->ticket->countAll(),
                'trend' => $this->ticket->getTrendPercentage()
            ],
            'today' => [
                'count' => $this->ticket->where('DATE(created_at)', date('Y-m-d'))->countAllResults(),
                'trend' => $this->ticket->getDailyTrend()
            ],
            'solved' => [
                'count' => $this->ticket->where('DATE(closed_at)', date('Y-m-d'))->countAllResults(),
                'trend' => $this->ticket->getSolvedTrend()
            ]
        ];

        $this->data['userStats'] = [
            'count' => $this->users->countAll(),
            'trend' => $this->users->getSignupTrend()
        ];

        $this->data['modal'] = false;

        return $this->template->render('admin/tickets/index', $this->data);
    }

    /**
     * Ver detalles de un ticket.
     *
     * @param int $id El ID del ticket
     *
     * @return ResponseInterface
     */
    public function details($ticketId)
    {
        $this->template->add_js_file('notifications');

        $userId = $this->auth->getUserId();
        $ticket = $this->ticket->getTicketWithDetails($ticketId, $userId);

        if (!$this->isAuthorized($ticket)) {
            return redirect()->to('/')->with('error', 'No tienes acceso a este ticket');
        }

        $this->notificate
            ->where('user_id', $userId)
            ->where('related_id', $ticketId)
            ->where('type', 'ticket')
            ->set(['is_read' => 1])
            ->update();

        $userGroups = $this->mauth->getUsersGroups($userId)->getResult();
        $this->data['userGroups'] = $userGroups;

        $groupNames = array_map(function ($group) {
            return $group->name;
        }, $userGroups);

        if (!$ticket) {
            return redirect()->to('/admin/tickets')->with('message', 'Ticket no encontrado');
        }

        // Verificar permisos
        if (!array_intersect(['admin', 'manager', 'technical'], $groupNames) && $ticket['user_id'] != $userId && $ticket['assigned_to'] != $userId) {
            return redirect()->to('/admin/tickets')->with('message', 'No tienes permiso para ver este ticket');
        }

        $this->data['page_title'] = 'Ticket #' . $ticket['id'] . ' - ' . $ticket['title'];
        $this->data['ticket'] = $ticket;
        $this->data['comments'] = $this->comment->getTicketComments($ticketId);
        $this->data['assigned'] = $this->ticket->getAssignedTech($ticketId);
        $this->data['usercan'] = [
            'edit' => $this->users->can('edit_tickets'),
            'reassign' => $this->users->can('reassign_tickets'),
            'close' => $this->users->can('close_tickets'),
            'comment' => $this->users->can('comment_tickets'),
            'view' => $this->users->can('view_all_tickets'),
            'change_status' => $this->users->can('change_status_tickets')
        ];

        $this->data['attachments'] = $this->attachment->where('ticket_id', $ticketId)->findAll();
        $this->data['technicians'] = $this->users->getTechniciansByCategory($ticket['category_id']);
        $this->data['categories'] = $this->category->getActiveCategories();

        $history = $this->history->where('ticket_id', $ticket['id'])->orderBy('changed_at', 'DESC')->findAll();

        $this->data['history'] = $history;
        $this->data['modal'] = false;

        return $this->template->render('admin/tickets/details', $this->data);
    }

    /**
     * Actualiza el estado de un ticket.
     *
     * @param int $id Identificador del ticket a actualizar.
     *
     * @return \CodeIgniter\HTTP\RedirectResponse Redirige a la pantalla de detalles del ticket.
     */
    public function updateStatus($id)
    {
        if (!$this->auth->loggedIn()) {
            return redirect()->to(site_url());
        }

        $userId = $this->auth->getUserId();
        $ticket = $this->ticket->find($id);
        if (!$ticket) {
            return redirect()->back()->with('error', 'Ticket no encontrado');
        }

        $newStatus = $this->request->getPost('status');
        $validStatuses = ['abierto', 'en_progreso', 'en_revision', 'cerrado'];

        if (!in_array($newStatus, $validStatuses)) {
            return redirect()->back()->with('error', 'Estado inválido');
        }

        $updateData = ['status' => $newStatus];

        if ($newStatus === 'cerrado') {
            $updateData['closed_at'] = date('Y-m-d H:i:s');
            $updateData['closed_by'] = $this->auth->getUserId();
        }

        if ($this->ticket->update($id, $updateData)) {
            // Registrar en el historial
            $this->ticket->addHistory($id, 'status', $ticket['status'], $newStatus, $userId);

            return redirect()->back()->with('message', 'Estado del ticket actualizado');
        }

        return redirect()->back()->with('error', 'Error al actualizar el ticket');
    }

    /**
     * Agrega un comentario a un ticket.
     *
     * Este método agrega un comentario a un ticket y devuelve el comentario
     * recién creado con datos del usuario. Si el usuario pertenece a un grupo
     * con permisos de administrador, manager o técnico, se puede marcar como
     * interno al comentario.
     *
     * @param int $ticketId El ID del ticket al que se agrega el comentario.
     * @return \CodeIgniter\HTTP\Response El comentario recién creado y un
     *         indicador de si es interno o no.
     */
    public function addComment($ticketId)
    {
        // Obtener grupos del usuario actual
        $userGroups = array_column(
            array_map(
                function ($g) {
                    return (array)$g;
                },
                $this->mauth->getUsersGroups($this->auth->getUserId())->getResult()
            ),
            'name'
        );

        // Determinar si es interno (solo para admin, manager o technical)
        $isInternal = (bool)(
            array_intersect(['admin', 'manager', 'technical'], $userGroups) &&
            $this->request->getPost('is_internal')
        );

        // Insertar comentario
        try {
            $this->comment->insert([
                'ticket_id' => $ticketId,
                'user_id' => $this->auth->getUserId(),
                'comment' => $this->request->getPost('comment'),
                'is_internal' => $isInternal,
                'created_at' => date('Y-m-d H:i:s')
            ]);

            // Obtener el comentario recién creado con datos del usuario
            $newComment = $this->comment->getTicketComments($ticketId);
            $newComment = end($newComment); // Obtener el último comentario

            return $this->response->setJSON([
                'success' => true,
                'message' => 'Comentario agregado correctamente',
                'comment' => $newComment,
                'isInternal' => $isInternal
            ]);
        } catch (\Exception $e) {
            log_message('error', 'Error al agregar comentario: ' . $e->getMessage());
            return $this->response->setJSON([
                'success' => false,
                'message' => 'Error al agregar el comentario'
            ]);
        }
    }

    /**
     * Retrieves comments associated with a specific ticket.
     *
     * This function fetches all comments related to the given ticket ID and
     * returns them in an array. The comments are ordered by their creation date
     * in ascending order.
     *
     * @param int $ticketId The ID of the ticket for which comments are retrieved.
     * @return \CodeIgniter\HTTP\Response An HTTP response containing the comments
     *         in JSON format.
     */
    public function getComments($ticketId)
    {
        $comments = $this->comment->getTicketComments($ticketId);

        // Modificar directamente el campo photo con la URL completa
        foreach ($comments as &$comment) {
            $comment = is_object($comment) ? (array)$comment : $comment;
            $comment['photo'] = $comment['photo'];
        }
        unset($comment); // Romper la referencia

        return $this->response->setJSON([
            'success' => true,
            'comments' => $comments
        ]);
    }

    public function notifications()
    {
        try {
            $userId = ($this->auth->getUserId()) ? $this->auth->getUserId() : $this->session->get('user_id'); // Usa tu sistema de autenticación
            $notifications = $this->notifications->getUnreadNotifications($userId);

            return $this->response->setJSON(
                array_map(function ($n) {
                    return [
                        'id' => $n['id'],
                        'type' => $n['type'],
                        'message' => $n['message'],
                        'priority' => $n['priority'],
                        'play_sound' => str_contains($n['type'], 'ticket'),
                        'link' => $n['link'],
                        'time' => $this->formatTime($n['created_at']),
                        'is_read' => (bool)$n['is_read']
                    ];
                }, $notifications)
            );
        } catch (\Exception $e) {
            log_message('error', 'Notification error: ' . $e->getMessage());
            return $this->response->setStatusCode(500)->setJSON([
                'status' => 'error',
                'message' => 'Error al cargar notificaciones'
            ]);
        }
    }

    public function markNotificationsAsRead()
    {
        // Verificar que sea petición AJAX/JSON
        if (!$this->request->isAJAX() || !$this->request->is('json')) {
            return $this->response->setStatusCode(400)->setJSON([
                'success' => false,
                'message' => 'Solo se permiten peticiones AJAX/JSON'
            ]);
        }

        $data = $this->request->getJSON(true);
        $notificationIds = $data['ids'] ?? [];

        // Usar el servicio de notificaciones
        $result = $this->notifications->markAsRead($notificationIds);

        return $this->respond($result);
    }

    public function assignTicketToTechnician($id)
    {
        $assignedTo = $this->request->getPost('assigned_to');
        $categoryId = $this->request->getPost('category_id');

        $ticket = $this->ticket->find($id);

        if ($ticket) {
            $this->ticket->set('assigned_to', $assignedTo)->where('id', $id)->update();

            try {
                $this->ticket->assignToTechnician($id, $categoryId);
                return redirect()->back()->with('message', 'Técnico asignado correctamente');
            } catch (\Exception $e) {
                log_message('error', 'Error al asignar ticket: ' . $e->getMessage());
                return redirect()->back()->with('error', 'Error al asignar al técnico');
            }
        }
    }

    protected function isAuthorized($ticket): bool
    {
        $userId = $this->auth->getUserId();

        // Admin/tecnicos ven todos los tickets
        if ($this->auth->isTech() || $this->auth->isAdmin()) {
            return true;
        }

        // Usuario normal solo ve sus tickets
        return $ticket['user_id'] == $userId;
    }

    private function formatTime($dateString)
    {
        $now = new \DateTime();
        $date = new \DateTime($dateString);
        $diff = $now->diff($date);

        if ($diff->days > 7) return $date->format('d M Y');
        if ($diff->days > 0) return "Hace {$diff->days} días";
        if ($diff->h > 0) return "Hace {$diff->h} horas";
        if ($diff->i > 0) return "Hace {$diff->i} minutos";
        return "Hace unos momentos";
    }
}
