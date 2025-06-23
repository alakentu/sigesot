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
            $this->data['page_title']   = $this->siteconfig->name . ' :: ' . lang('Auth.admin_heading');
            $this->data['message']      = $this->validation->getErrors() ? $this->validation->listErrors($this->validationListTemplate) : $this->session->getFlashdata('message');

            $this->data['users'] = $this->auth->users()->result();

            foreach ($this->data['users'] as $k => $user) {
                $this->data['users'][$k]->groups = $this->auth->getUsersGroups($user->id)->getResult();
            }

            return $this->template->render('admin/index', $this->data);
        }
    }

    public function createTicket()
    {
        // Validar límite antes de mostrar formulario
        $userId = $this->session->get('user_id');

        if ($this->ticket->countActiveTickets($userId) >= 3) {
            return redirect()->back()->with('error', 'Límite de tickets alcanzado. Cierre algunos antes de crear nuevos.');
        }

        // Mostrar vista normal (el formulario ya está en dashboard.php)
        return $this->template->render('admin/index', $this->data);
    }

    public function storeTicket()
    {
        $this->validation->setRules([
            'title' => 'required|max_length[255]',
            'description' => 'required',
            'priority' => 'required|in_list[low,medium,high]'
        ]);

        if (!$this->validation->withRequest($this->request)->run()) {
            return redirect()->back()->withInput()->with('errors', $this->validation->getErrors());
        }

        $userId = $this->session->get('user_id');

        // Validación de seguridad adicional
        if ($this->ticket->countActiveTickets($userId) >= 3) {
            return redirect()->back()->with('error', 'Acción denegada: Límite excedido');
        }

        try {
            $ticketId = $this->ticket->insert([
                'user_id' => $userId,
                'title' => $this->request->getPost('title'),
                'description' => $this->request->getPost('description'),
                'priority' => $this->request->getPost('priority'),
                'status' => 'open'
            ]);

            // Disparar notificación a técnicos
            $this->notifications->notifyTechnicians($ticketId);

            return redirect()->back()->with('success', 'Ticket creado y técnicos notificados');
        } catch (\Exception $e) {
            log_message('error', $e->getMessage());
            return redirect()->back()->with('error', 'Error al crear ticket');
        }
    }
}
