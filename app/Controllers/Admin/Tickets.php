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

        $this->data['page_title'] = 'Gestión de Solicitudes';
        $this->data['tickets'] = $this->ticket->getActiveTickets($this->auth->getUserId());
        $this->data['categories'] = $this->category->findAll();

        return $this->template->render('admin/tickets/index', $this->data);
    }

    public function create()
    {
        if (!$this->auth->loggedIn()) {
            return redirect()->to('/auth/login');
        }

        if ($this->request->getMethod() === 'post') {
            $rules = [
                'title' => 'required|min_length[5]|max_length[100]',
                'description' => 'required|min_length[10]',
                'category_id' => 'required|numeric'
            ];

            if ($this->validate($rules)) {
                $this->ticket->save([
                    'title' => $this->request->getPost('title'),
                    'description' => $this->request->getPost('description'),
                    'user_id' => $this->auth->getUserId(),
                    'category_id' => $this->request->getPost('category_id'),
                    'priority' => $this->request->getPost('priority') ?? 'medium'
                ]);

                return redirect()->to('/tickets')->with('message', 'Ticket creado exitosamente');
            }
        }

        $data['validation'] = $this->validator ?? null;
        $data['categories'] = $this->category->findAll();

        return $this->template->render('admin/tickets/create', $this->data);
    }
}
