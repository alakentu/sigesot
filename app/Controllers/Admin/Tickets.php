<?php

namespace App\Controllers\Admin;

use App\Controllers\Admin\AdminController;

class Tickets extends AdminController
{
    public function index()
    {
        if (!$this->auth->loggedIn()) {
            return redirect()->to('/auth/login');
        }

        $this->template->add_file('datatables');

        $userId = $this->auth->getUserId();
        $userGroups = $this->mauth->getUsersGroups($userId)->getResult();
        //$tickets_data = '';

        $this->data['page_title'] = 'Solicitudes de Soporte';

        // Mostrar tickets diferentes según el rol
        switch ($userGroups) {
            case ['admin', 'manager']:
                $tickets_data = $this->ticket->getAllTickets();
                break;
            case ['technical']:
                $tickets_data = $this->ticket->getAssignedTickets($userId);
                break;
            default:
                $tickets_data = $this->ticket->getUserTickets($userId);
                break;
        }
        //if (in_array('admin', $userGroups) || in_array('manager', $userGroups)) {
        //    $tickets_data = $this->ticket->getAllTickets();
        //} elseif (in_array('technical', $userGroups)) {
        //    $tickets_data = $this->ticket->getAssignedTickets($userId);
        //} else {
        //    $tickets_data = $this->ticket->getUserTickets($userId);
        //}

        $this->data['tickets'] = $tickets_data;
        $this->data['categories'] = $this->category->getActiveCategories();
        $this->data['userGroups'] = $userGroups;

        return $this->template->render('admin/tickets/index', $this->data);
    }

    public function create()
    {
        if (!$this->auth->loggedIn()) {
            return redirect()->to('/auth/login');
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

    protected function notifyAssignedTechnicians($ticketId)
    {
        // Obtener técnicos según categoría del ticket
        $ticket = $this->ticket->find($ticketId);
        $technicians = $this->users->getTechnicians();
        //$technicians = $this->users->getTechniciansByCategory($ticket['category_id']);

        // Filtrar por categoría si es necesario
        $technicians = array_filter($technicians, function ($tech) use ($ticket) {
            // Aquí podrías añadir lógica para filtrar por categoría
            return true;
        });

        // Enviar notificaciones (esto sería un servicio aparte)
        $notificationService = service('notifications');
        $notificationService->notifyNewTicket($ticketId, $technicians);
    }

    public function view($id)
    {
        if (!$this->auth->loggedIn()) {
            return redirect()->to('/auth/login');
        }

        $ticket = $this->ticket->getTicketWithDetails($id);
        if (!$ticket) {
            return redirect()->to('/tickets')->with('error', 'Ticket no encontrado');
        }

        // Verificar permisos
        $userId = $this->auth->getUserId();
        if (
            !in_array('admin', $this->mauth->getUsersGroups($userId)->getResult()) &&
            $ticket['user_id'] != $userId &&
            $ticket['assigned_to'] != $userId
        ) {
            return redirect()->to('/tickets')->with('error', 'No tienes permiso para ver este ticket');
        }

        $this->data['page_title'] = 'Ticket #' . $ticket['id'] . ' - ' . $ticket['title'];
        $this->data['ticket'] = $ticket;
        $this->data['comments'] = $this->ticket->getTicketComments($id);
        $this->data['attachments'] = $this->attachment->where('ticket_id', $id)->findAll();
        $this->data['technicians'] = $this->users->getTechniciansByCategory($ticket['category_id']);

        return $this->template->render('admin/tickets/view', $this->data);
    }

    public function updateStatus($id)
    {
        if (!$this->auth->loggedIn()) {
            return redirect()->to('/auth/login');
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
}
