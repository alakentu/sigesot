<?php

namespace App\Controllers\Admin;

use App\Controllers\Admin\AdminController;

class Audit extends AdminController
{
    public function index()
    {
        $this->data['page_title'] = 'Seguridad :: Auditoría';

        return $this->template->render('admin/audit/index', $this->data);
    }
}
