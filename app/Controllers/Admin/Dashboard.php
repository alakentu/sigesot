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
}
