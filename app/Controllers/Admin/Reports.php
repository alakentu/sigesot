<?php

namespace App\Controllers\Admin;

use App\Controllers\Admin\AdminController;

class Reports extends AdminController
{
    public function index()
    {
        $this->data['page_title'] = 'Seguridad :: Reportes';
        $this->data['modal'] = false;

        return $this->template->render('admin/reports/index', $this->data);
    }
}
