<?php

namespace App\Controllers\Admin;

use App\Controllers\Admin\AdminController;
use CodeIgniter\Files\File;

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
        } else {
            $this->template->add_js_file('notifications');
            $userId = $this->auth->getUserId();

            // Configuración básica
            $this->data['page_title']   = $this->siteconfig->name . ' :: ' . lang('Auth.admin_heading');
            $this->data['message']      = $this->validation->getErrors() ? $this->validation->listErrors($this->validationListTemplate) : $this->session->getFlashdata('message');

            // Verificación de límite de tickets
            $this->data['users'] = $this->auth->users()->result();
            $this->data['helpdesk'] = $this->helpdesk;
            $this->data['categories'] = $this->category->getActiveCategories();
            $this->data['modal'] = false;

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
        // Obtenemos la ID del usuario creador del ticket
        $userId = (int) $this->request->getPost('user_id');
        $responseData = ['success' => false]; // Base para la respuesta
        $debugData = []; // Datos de depuración

        // Validación de límite de tickets
        if ($this->ticket->countUserTickets($userId) >= $this->helpdesk->max_tickets_per_user) {
            return $this->response->setJSON([
                'error' => lang('Site.TicketLimitReached', [$this->helpdesk->max_tickets_per_user])
            ]);
        }

        $validationRules = [
            'title' => 'required|min_length[5]|max_length[100]',
            'description' => 'required|min_length[10]',
            'category_id' => 'required|numeric',
            'priority' => 'required|in_list[alta,media,baja]'
        ];

        // Solo agregar reglas de archivo si se subió algo
        if ($this->request->getFile('userfile')->isValid()) {
            $fileRules = [
                'userfile' => [
                    'rules' => [
                        'uploaded[userfile]',
                        'is_image[userfile]',
                        'mime_in[userfile,' . $this->helpdesk->allowed_file_types . ']',
                        'max_size[userfile,2048]',
                        'max_dims[userfile,1024,768]',
                    ]
                ]
            ];
            $validationRules = array_merge($validationRules, $fileRules);
        }

        if (!$this->validate($validationRules)) {
            return redirect()->back()->withInput()->with('errors', $this->validator->getErrors());
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

            // 1. Insertar ticket
            if (!$this->ticket->insert($ticketData)) {
                throw new \Exception('Error al insertar ticket: ' . implode(', ', $this->ticket->errors()));
            }
            $ticketId = $this->db->insertID();
            $responseData['ticket_id'] = $ticketId;

            // 2. Asignar técnico (con menor carga de trabajo)
            $assignedTech = $this->ticket->assignToTechnician($ticketId, $ticketData['category_id']);

            if (!$assignedTech) {
                throw new \Exception('No se pudo asignar técnico para este ticket');
            }

            if ($assignedTech) {
                $this->ticket->update($ticketId, ['assigned_to' => $assignedTech['id']]);
                $responseData['assigned_tech'] = $assignedTech['id']; // Para debug

                // 2.1. Notificar solo al técnico asignado (en tiempo real)
                $this->notifications->notifyNewTicket($ticketId, [$assignedTech['id']], $ticketData['priority']);
            }

            // 3. Registrar auditoría con manejo especial para particionamiento
            $auditMessage = "Creación de Ticket #{$ticketId}";
            try {
                $this->audits->logAudit('tickets', $ticketId, 'CREATE', null, $ticketData);
                $this->audits->logActivity($auditMessage, "Usuario creó ticket #{$ticketId}");
            } catch (\Exception $e) {
                $debugData['audit_error'] = 'Error al registrar auditoría: ' . $e->getMessage();
                // No rompemos el flujo por error de auditoría
            }

            // 4. Procesar adjuntos
            $file = $this->request->getFile('userfile');

            if ($file) {
                if ($file->isValid() && !$file->hasMoved()) {
                    try {
                        $newName = $file->getRandomName();
                        $filepath = ROOTPATH . 'public/assets/attachments/tickets';

                        if (!is_dir($filepath)) {
                            mkdir($filepath, 0755, true);
                        }

                        if ($file->move($filepath, $newName)) {
                            $attachmentData = [
                                'ticket_id' => $ticketId,
                                'user_id' => $userId,
                                'file_name' => $file->getClientName(),
                                'file_path' => 'assets/attachments/tickets/' . $newName,
                                'file_size' => $file->getSize(),
                                'file_type' => $file->getClientMimeType()
                            ];

                            if (!$this->attachment->save($attachmentData)) {
                                $debugData['attachment_error'] = implode(', ', $this->attachment->errors());
                            }
                        } else {
                            $debugData['attachment_error'] = $file->getErrorString();
                        }
                    } catch (\Exception $e) {
                        $debugData['attachment_error'] = $e->getMessage();
                    }
                }
            }

            $this->db->transComplete();

            if ($this->db->transStatus() === false) {
                throw new \Exception('Error en la transacción de base de datos');
            }

            // Respuesta exitosa
            $responseData['success'] = true;
            $responseData['toast'] = lang('Site.TicketCreated');
            $responseData['ticketsRemaining'] = $this->ticket->checkUserTicketLimit($userId)['remaining'];

            // Solo mostrar debug en desarrollo
            if (ENVIRONMENT === 'development' && !empty($debugData)) {
                $responseData['debug'] = $debugData;
            }

            return $this->response->setJSON($responseData);
        } catch (\Exception $e) {
            $this->db->transRollback();

            // Registrar error completo
            $errorMessage = 'Error al crear el ticket: ' . $e->getMessage();
            log_message('error', $errorMessage);
            log_message('debug', 'Última consulta: ' . $this->db->getLastQuery());

            // Construir respuesta de error
            $responseData['error'] = $errorMessage;
            $responseData['debug'] = ENVIRONMENT === 'development' ? [
                'trace' => $e->getTraceAsString(),
                'last_query' => $this->db->getLastQuery(),
                'additional_debug' => $debugData
            ] : null;

            return $this->response->setJSON($responseData)->setStatusCode(500);
        }
    }

    public function getTicketCount()
    {
        // Verificar si es una solicitud AJAX
        if (!$this->request->isAJAX()) {
            return $this->response->setStatusCode(403)->setJSON(['error' => 'Acceso no permitido']);
        }

        $userId = $this->auth->getUserId();

        try {
            $count = $this->ticket->countActiveTickets($userId);

            return $this->response->setJSON([
                'count' => $count,
                'limit' => 3, // Límite configurable
                'available' => $count < 3
            ]);
        } catch (\Exception $e) {
            log_message('error', 'Error counting tickets: ' . $e->getMessage());
            return $this->response->setStatusCode(500)->setJSON(['error' => 'Error interno']);
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
