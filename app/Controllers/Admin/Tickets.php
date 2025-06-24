<?php

namespace App\Controllers\Admin;

use App\Controllers\Admin\AdminController;

class Tickets extends AdminController
{
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

        return $this->template->render('admin/tickets/index', $this->data);
    }

    /**
     * Handles the creation of a new support ticket.
     * 
     * Ensures the user is logged in and checks if they have reached their ticket limit.
     * If the user can create a ticket and the request method is POST, processes the ticket creation.
     * Otherwise, prepares the necessary data for rendering the ticket creation form.
     * 
     * Redirects to the tickets page with an error message if the user has reached their ticket limit.
     * 
     * @return mixed Redirects to a different URL or renders the ticket creation form.
     */
    public function create()
    {
        if (!$this->auth->loggedIn()) {
            return redirect()->to(site_url());
        }

        $userId = $this->auth->getUserId();

        // Verificar límite de tickets
        $ticketLimit = $this->ticket->checkUserTicketLimit($userId);
        if (!$ticketLimit['canCreate']) {
            return redirect()->to('/tickets')->with('error', $ticketLimit['message']);
        }

        if ($this->request->getMethod() === 'post') {
            return $this->processTicketCreation($userId);
        }

        $this->data['validation'] = $this->validator ?? null;
        $this->data['categories'] = $this->category->getActiveCategories();
        $this->data['ticketsRemaining'] = $ticketLimit['remaining'];
        $this->data['page_title'] = 'Crear Nuevo Ticket';

        return $this->template->render('admin/tickets/create', $this->data);
    }

    /**
     * Process a ticket creation request.
     *
     * This function validates the request data with the given rules, saves the
     * ticket to the database, processes any attachments and notifies assigned
     * technicians.
     *
     * @param int $userId The user ID of the user creating the ticket.
     * @return \CodeIgniter\HTTP\RedirectResponse The response.
     */
    protected function processTicketCreation($userId)
    {
        $rules = [
            'title' => 'required|min_length[5]|max_length[100]',
            'description' => 'required|min_length[10]',
            'category_id' => 'required|numeric',
            'priority' => 'required|in_list[alta,media,baja]',
            'attachments.*' => 'max_size[attachments,5120]|mime_in[attachments,image/jpeg,image/png,application/pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document]'
        ];

        if (!$this->validate($rules)) {
            return redirect()->back()->withInput()->with('errors', $this->validator->getErrors());
        }

        // Guardar ticket
        $ticketData = [
            'title' => $this->request->getPost('title'),
            'description' => $this->request->getPost('description'),
            'user_id' => $userId,
            'category_id' => $this->request->getPost('category_id'),
            'priority' => $this->request->getPost('priority'),
            'status' => 'abierto'
        ];

        if ($this->ticket->save($ticketData)) {
            $ticketId = $this->ticket->getInsertID();

            // Procesar adjuntos
            $this->processAttachments($ticketId, $userId);

            // Notificar a técnicos
            $this->notifyAssignedTechnicians($ticketId);

            return redirect()->to('/tickets')->with('message', 'Ticket creado exitosamente');
        }

        return redirect()->back()->withInput()->with('error', 'Error al crear el ticket');
    }

    /**
     * Processes and saves attachments for a given ticket.
     *
     * This function retrieves files from the request and processes each
     * valid attachment by moving it to a designated directory and saving
     * its details to the database. Only files that have not been moved
     * and are valid are processed.
     *
     * @param int $ticketId The ID of the ticket to which attachments belong.
     * @param int $userId The ID of the user uploading the attachments.
     * @return void
     */
    protected function processAttachments($ticketId, $userId)
    {
        $files = $this->request->getFiles();

        if ($files && isset($files['attachments'])) {
            foreach ($files['attachments'] as $file) {
                if ($file->isValid() && !$file->hasMoved()) {
                    $newName = $file->getRandomName();
                    $file->move(WRITEPATH . 'uploads/tickets', $newName);

                    $this->attachment->save([
                        'ticket_id' => $ticketId,
                        'user_id' => $userId,
                        'file_name' => $file->getClientName(),
                        'file_path' => 'uploads/tickets/' . $newName,
                        'file_size' => $file->getSize(),
                        'file_type' => $file->getClientMimeType()
                    ]);
                }
            }
        }
    }

    /**
     * Notifica a los técnicos asignados según la categoría del ticket
     * recién creado.
     *
     * @param int $ticketId ID del ticket recién creado
     */
    protected function notifyAssignedTechnicians($ticketId)
    {
        // Obtener técnicos según categoría del ticket
        $ticket = $this->ticket->find($ticketId);
        $technicians = $this->users->getTechnicians();

        // Filtrar por categoría si es necesario
        $technicians = array_filter($technicians, function ($tech) use ($ticket) {
            return true;
        });

        // Enviar notificaciones (esto sería un servicio aparte)
        $notificationService = service('notifications');
        $notificationService->notifyNewTicket($ticketId, $technicians);
    }

    public function view($id)
    {
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

        return $this->template->render('admin/tickets/view', $this->data);
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

    // Método para obtener comentarios
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
}
