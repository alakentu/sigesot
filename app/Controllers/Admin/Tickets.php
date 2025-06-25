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
        $this->template->add_js_file('jquery.dataTables,dataTables.bootstrap5,dataTables.responsive,dataTables.buttons,buttons.print,buttons.html5,vfs_fonts,pdfmake,jszip');

        $userId = $this->auth->getUserId();
        $userGroups = $this->mauth->getUsersGroups($userId)->getResult();
        $groupNames = array_map(function ($group) {
            return $group->name;
        }, $userGroups);

        $this->data['page_title'] = 'Solicitudes de Soporte';

        if (array_intersect(['admin', 'manager'], $groupNames)) {
            $builder = $this->ticket->getAllTickets();
        } elseif (array_intersect(['technical'], $groupNames)) {
            $builder = $this->ticket->getAssignedTicketsBuilder($userId);
        } else {
            $builder = $this->ticket->getUserTicketsBuilder($userId);
        }

        // Aplicar filtros
        switch ($filter) {
            case 'today':
                $builder = $this->ticket->select('*')->where('DATE(created_at)', date('Y-m-d'))->findAll();
                break;
            case 'solved_today':
                $builder = $this->ticket->select('*')->where('DATE(closed_at)', date('Y-m-d'))->where('status', 'cerrado')->findAll();
                break;
            case 'open':
                $builder = $this->ticket->select('*')->where('status', 'abierto')->findAll();
                break;
            case 'in_progress':
                $builder = $this->ticket->select('*')->where('status', 'en_progreso')->findAll();
                break;
            case 'closed':
                $builder = $this->ticket->select('*')->where('status', 'cerrado')->findAll();
                break;
            default:
                break;
        }

        $this->data['tickets'] = $builder;
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

        return $this->template->render('admin/tickets/index', $this->data);
    }

    /**
     * Ver detalles de un ticket.
     *
     * @param int $id El ID del ticket
     *
     * @return ResponseInterface
     */
    public function details($id)
    {
        // Verificar autenticación
        if (!$this->auth->loggedIn()) {
            return redirect()->to(site_url());
        }

        $userId = $this->auth->getUserId();
        $userGroups = $this->mauth->getUsersGroups($userId)->getResult();
        $this->data['userGroups'] = $userGroups;

        $groupNames = array_map(function ($group) {
            return $group->name;
        }, $userGroups);

        $ticket = $this->ticket->getTicketWithDetails($id);
        if (!$ticket) {
            return redirect()->to('/admin/tickets')->with('message', 'Ticket no encontrado');
        }

        // Verificar permisos
        if (!array_intersect(['admin', 'manager'], $groupNames) && $ticket['user_id'] != $userId && $ticket['assigned_to'] != $userId) {
            return redirect()->to('/admin/tickets')->with('message', 'No tienes permiso para ver este ticket');
        }

        $this->data['page_title'] = 'Ticket #' . $ticket['id'] . ' - ' . $ticket['title'];
        $this->data['ticket'] = $ticket;
        $this->data['comments'] = $this->comment->getTicketComments($id);
        $this->data['attachments'] = $this->attachment->where('ticket_id', $id)->findAll();
        $this->data['technicians'] = $this->users->getTechniciansByCategory($ticket['category_id']);
        $this->data['categories'] = $this->category->getActiveCategories();

        $history = $this->history->where('ticket_id', $ticket['id'])->orderBy('changed_at', 'DESC')->findAll();

        $this->data['history'] = $history;

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
            $this->ticket->addHistory($id, 'status', $ticket['status'], $newStatus);

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
        $userId = $this->auth->getUserId(); // Usa tu sistema de autenticación

        if (!$userId) {
            return $this->failUnauthorized();
        }

        $notifications = service('notifications')->getUnreadNotifications($userId);

        return $this->respond([
            'data' => array_map(function ($notif) {
                return [
                    'id' => $notif['id'] ?? null,
                    'type' => $notif['type'],
                    'message' => $notif['message'],
                    'time' => timeAgo($notif['created_at']),
                    'link' => $this->getNotificationLink($notif),
                    'is_read' => $notif['is_read'] ?? 0
                ];
            }, $notifications)
        ]);
    }

    public function markNotificationsAsRead()
    {
        $ids = $this->request->getJSON(true)['ids'] ?? [];

        if (!empty($ids)) {
            service('notifications')->markAsRead($ids);
        }

        return $this->respond(['status' => 'success']);
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
}
