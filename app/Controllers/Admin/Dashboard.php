<?php

namespace App\Controllers\Admin;

use App\Controllers\Admin\AdminController;

class Dashboard extends AdminController
{
    /**
     * Redirecciona si es necesario, de lo contrario, muestra la página principal del sistema (administración)
     *
     * @return string|\CodeIgniter\HTTP\RedirectResponse
     */
    public function index()
    {
        if (!$this->auth->loggedIn()) {
            return redirect()->to(site_url());
        } else if (!$this->auth->isAdmin()) {
            throw new \Exception('Usted debe ser administrador para poder visualizar esta página.');
        } else {
            $userId = $this->auth->getUserId();

            // Configuración básica
            $this->data['page_title']   = $this->siteconfig->name . ' :: ' . lang('Auth.admin_heading');
            $this->data['message']      = $this->validation->getErrors() ? $this->validation->listErrors($this->validationListTemplate) : $this->session->getFlashdata('message');

            // Verificación de límite de tickets
            $this->data['users'] = $this->auth->users()->result();
            $this->data['helpdesk'] = $this->helpdesk;
            $this->data['categories'] = $this->category->getActiveCategories();

            $userId = $this->auth->getUserId();
            $ticketLimit = $this->ticket->checkUserTicketLimit($userId);
            $this->data['ticketsRemaining'] = $ticketLimit['remaining'];
            $this->data['canCreateTicket'] = $ticketLimit['canCreate'];

            $ticketLimit = [
                'remaining' => max(0, $this->helpdesk->max_tickets_per_user - $this->ticket->countActiveTickets($userId)),
                'canCreate' => $this->ticket->countActiveTickets($userId) < $this->helpdesk->max_tickets_per_user
            ];

            $this->data['jsLang'] = [
                'ticketLimitReached' => lang('Site.TicketLimitReached'),
                'ticketCreated' => lang('Site.TicketCreated')
            ];

            foreach ($this->data['users'] as $k => $user) {
                $this->data['users'][$k]->groups = $this->auth->getUsersGroups($user->id)->getResult();
            }

            return $this->template->render('admin/index', $this->data);
        }
    }

    /**
     * Guarda un nuevo ticket en la base de datos y notifica a los técnicos asignados.
     *
     * Verifica si el usuario ha alcanzado el límite de tickets y si los archivos adjuntos
     * cumplen con los requisitos de tamaño y tipo.
     *
     * @return \CodeIgniter\HTTP\Response
     */
    public function storeTicket()
    {
        error_log("Datos recibidos: " . print_r($this->request->getPost(), true));
        error_log("Archivos recibidos: " . print_r($_FILES, true));

        $userId = $this->auth->getUserId();

        // Validación de límite
        if ($this->ticket->countUserTickets($userId) >= $this->helpdesk->max_tickets_per_user) {
            return $this->response->setJSON([
                'error' => str_replace('{0}', $this->helpdesk->max_tickets_per_user, lang('Site.TicketLimitReached'))
            ]);
        }

        // Validación de archivos adjuntos
        $rules = [
            'title' => 'required|min_length[5]|max_length[100]',
            'description' => 'required|min_length[10]',
            'category_id' => 'required|numeric',
            'priority' => 'required|in_list[alta,media,baja]',
            'attachments.*' => [
                'uploaded[attachments.0]', // Solo valida si hay al menos un archivo
                'max_size[attachments.0,' . $this->helpdesk->ticket_attachment_max_size . ']',
                'mime_in[attachments.0,' . implode(',', $this->helpdesk->allowed_file_types) . ']'
            ]
        ];

        if (!$this->validate($rules)) {
            return $this->response->setJSON([
                'errors' => $this->validator->getErrors()
            ]);
        }

        try {
            $ticketData = [
                'title' => $this->request->getPost('title'),
                'description' => $this->request->getPost('description'),
                'user_id' => $userId,
                'category_id' => $this->request->getPost('category_id'),
                'priority' => $this->request->getPost('priority'),
                'status' => 'abierto'
            ];

            $this->db->transStart();

            // 1. Guardar ticket en la base de datos
            $this->ticket->insert($ticketData);
            $ticketId = $this->db->insertID();

            // 2. Auto-asignar técnico
            $assignedTech = $this->ticket->assignToTechnician($ticketId, $ticketData['category_id']);
            if ($assignedTech) {
                $ticketData['assigned_to'] = $assignedTech['id'];
                $this->ticket->update($ticketId, ['assigned_to' => $assignedTech['id']]);
            }

            // 3. Registrar auditoría
            $this->audits->logAudit('tickets', $ticketId, 'CREATE', null, $ticketData);
            $this->audits->logActivity('Creación de Ticket', "Usuario creó ticket #{$ticketId}");

            // 4. Notificaciones
            $technicians = $this->users->getTechnicians();
            $this->notifications->notifyNewTicket($ticketId, $technicians, $ticketData['priority']);

            // Procesar adjuntos si existen
            if ($this->request->getFiles()) {
                $this->processAttachments($ticketId, $userId);
            }

            $this->db->transComplete();

            return $this->response->setJSON([
                'success' => true,
                'ticket_id' => $ticketId,
                'toast' => lang('Site.TicketCreated'),
                'ticketsRemaining' => $this->ticket->checkUserTicketLimit($userId)['remaining']
            ]);
        } catch (\Exception $e) {
            $this->db->transRollback();

            log_message('error', $e->getMessage());

            $this->audits->logActivity('Error en Ticket', "Falló creación de ticket: " . $e->getMessage());

            return $this->response->setJSON([
                'error' => 'Error al crear el ticket: ' . $e->getMessage()
            ]);
        }
    }

    /**
     * Procesa los archivos adjuntos a un ticket y los guarda en la carpeta
     * "uploads/tickets" con un nombre aleatorio. Luego, crea un registro en la
     * tabla "attachments" con los datos del archivo adjunto y su relación con
     * el ticket.
     *
     * @param int $ticketId ID del ticket al que se le están adjuntando los archivos
     * @param int $userId ID del usuario que está creando el ticket y adjuntando los archivos
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
     * Notifica a los técnicos asignados sobre la creación de un nuevo ticket.
     *
     * @param int $ticketId ID del ticket recién creado
     */
    protected function notifyAssignedTechnicians($ticketId)
    {
        $ticket = $this->ticket->find($ticketId);
        $technicians = $this->users->getTechnicians();

        $notificationService = service('notifications');
        $notificationService->notifyNewTicket($ticketId, $technicians);
    }

    /**
     * Devuelve un JSON con la lista de técnicos con su carga actual de tickets.
     *
     * @return \CodeIgniter\HTTP\Response
     */
    public function getTechniciansWorkload()
    {
        return $this->response->setJSON(
            $this->users->getTechniciansWithWorkload()
        );
    }
}
