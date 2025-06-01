<?php

namespace App\Controllers\Admin;

use App\Controllers\Admin\AdminController;

class Requests extends AdminController
{
    public function index()
    {
        $this->data['page_title'] = 'Gestión de Solicitudes';

        return $this->template->render('admin/requests/index', $this->data);
    }
}
