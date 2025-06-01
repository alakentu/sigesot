<?php

namespace App\Controllers\Admin;

use App\Controllers\Admin\AdminController;

class Inventory extends AdminController
{
    public function index()
    {
        $this->data['page_title'] = 'Gestión de Inventario';

        return $this->template->render('admin/inventory/index', $this->data);
    }
}
