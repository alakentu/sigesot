<?php

namespace App\Controllers\Admin;

use App\Controllers\Admin\AdminController;

class Users extends AdminController
{
    public function index()
    {
        if (! $this->auth->loggedIn() || ! $this->auth->isAdmin()) {
            return redirect()->to(site_url());
        }

        $this->data['page_title'] = 'Gestión de Usuarios';

        $this->template->add_css_file('dataTables.bootstrap5,responsive.bootstrap,buttons.dataTables');
        $this->template->add_js_file('jquery.dataTables,dataTables.bootstrap5,dataTables.responsive,dataTables.buttons,buttons.print,buttons.html5,vfs_fonts,pdfmake,jszip');

        // Modal
        $this->data['modal_title'] = lang('Auth.create_user_heading');
        $this->data['modal_subheading'] = lang('Auth.create_user_subheading');
        $this->data['modal_body'] = $this->renderForm();
        $this->data['modal_button'] = 'addNewUser';

        $this->data['message'] = $this->validation->getErrors() ? $this->validation->listErrors($this->validationListTemplate) : $this->session->getFlashdata('message');

        return $this->template->render('admin/users/index', $this->data);
    }

    public function getUsersData()
    {
        //$users = $this->users->findAll();
        $userModel = $this->users;

        // Parámetros de DataTables (paginación, búsqueda, etc.)
        $draw = $this->request->getPost('draw');
        $start = $this->request->getPost('start');
        $length = $this->request->getPost('length');
        $searchValue = $this->request->getPost('search')['value'];

        // Consulta base
        $builder = $userModel->select('*');

        // Búsqueda (opcional)
        if (!empty($searchValue)) {
            $builder->groupStart()
                ->like('username', $searchValue)
                ->orLike('email', $searchValue)
                ->groupEnd();
        }

        // Total de registros (sin paginación)
        $totalRecords = $userModel->countAll();

        // Registros filtrados (con búsqueda)
        $filteredRecords = $builder->countAllResults(false);

        // Paginación y orden (ejemplo: ordenar por ID ascendente)
        $users = $builder->orderBy('id', 'ASC')->findAll($length, $start);

        // Formatear datos para DataTables
        $data = [];

        foreach ($users as $user) {
            $data[] = [
                'id' => $user['id'],
                'names' => $user['first_name'] . ' ' . $user['middle_name'] . ' ' . $user['first_last_name'] . ' ' . $user['second_last_name'],
                'phone' => $user['phone'],
                'username' => $user['username'],
                'photo' => $user['photo'],
                'gender' => $user['gender'],
                'nationality' => $user['nationality'],
                'company' => $user['company'],
                'active' => $user['active'],
                'email' => $user['email'],
                'created_at' => date('d-m-Y h:i:s A', $user['created_on']),
            ];
        }

        // Respuesta JSON
        return $this->response->setJSON([
            'draw' => $draw,
            'recordsTotal' => $totalRecords,
            'recordsFiltered' => $filteredRecords,
            'data' => $data,
        ]);
    }

    public function changeUserStatus()
    {
        if ($this->request->isAJAX()) {

            $id     = $this->request->getPost('id');
            $status = $this->request->getPost('status');
            $result = $this->users->changeStatus($id, $status);

            if ($result) {
                return $result;
            }
        }
    }

    public function createUser()
    {
        if ($this->request->isAJAX()) {
            $tables         = $this->cauth->tables;
            $identityColumn = $this->cauth->identity;

            // Validamos los datos recibidos
            $this->validation->setRule('first_name', lang('Auth.create_user_validation_fname_label'), 'trim|required');
            $this->validation->setRule('first_last_name', lang('Auth.create_user_validation_flname_label'), 'trim|required');

            if ($identityColumn !== 'email') {
                $this->validation->setRule('identity', lang('Auth.create_user_validation_identity_label'), 'trim|required|is_unique[' . $tables['users'] . '.' . $identityColumn . ']');
                $this->validation->setRule('email', lang('Auth.create_user_validation_email_label'), 'trim|required|valid_email|is_unique[' . $tables['users'] . '.email]');
            } else {
                $this->validation->setRule('email', lang('Auth.create_user_validation_email_label'), 'trim|required|valid_email|is_unique[' . $tables['users'] . '.email]');
            }

            $this->validation->setRule('phone', lang('Auth.create_user_validation_phone_label'), 'trim');
            $this->validation->setRule('company', lang('Auth.create_user_validation_company_label'), 'trim');
            $this->validation->setRule('password', lang('Auth.create_user_validation_password_label'), 'required|min_length[' . $this->cauth->minPasswordLength . ']|matches[password_confirm]');
            $this->validation->setRule('password_confirm', lang('Auth.create_user_validation_password_confirm_label'), 'required');

            if ($this->request->getPost() && $this->validation->withRequest($this->request)->run()) {
                $email      = strtolower($this->request->getPost('email', FILTER_SANITIZE_EMAIL));
                $identity   = ($identityColumn === 'email') ? $email : $this->request->getPost('identity');
                $password   = $this->request->getPost('password');

                $groups = $this->request->getPost('groups');
                $groupIds = [];

                // Si es un solo grupo (no array), lo convertimos a array para uniformidad
                if (!is_array($groups)) {
                    $groups = [$groups];
                }

                // Mapeamos los nombres de grupo a sus IDs
                foreach ($groups as $groupName) {
                    switch ($groupName) {
                        case 'admin':
                            $groupIds[] = 1;
                            break;
                        case 'manager':
                            $groupIds[] = 2;
                            break;
                        case 'technical':
                            $groupIds[] = 3;
                            break;
                        case 'members':
                            $groupIds[] = 4;
                            break;
                    }
                }

                $additionalData = [
                    'first_name'        => $this->request->getPost('first_name'),
                    'middle_name'       => $this->request->getPost('middle_name'),
                    'first_last_name'   => $this->request->getPost('first_last_name'),
                    'second_last_name'  => $this->request->getPost('second_last_name'),
                    'gender'            => $this->request->getPost('gender', FILTER_SANITIZE_NUMBER_INT),
                    'nationality'       => $this->request->getPost('nationality', FILTER_SANITIZE_NUMBER_INT),
                    'company'           => $this->request->getPost('company'),
                    'phone'             => $this->request->getPost('phone', FILTER_SANITIZE_NUMBER_INT),
                    'photo'             => $this->request->getPost('photo')
                ];
            }

            if ($this->request->getPost() && $this->validation->withRequest($this->request)->run() && $this->auth->register($identity, $password, $email, $additionalData, $groupIds)) {
                // Comprobamos si estamos creando el usuario
                // Redirreccionamos de nuevo a la página de usuarios
                $this->session->setFlashdata('message', $this->auth->messages());
                echo json_encode([
                    'code' => 1,
                    'redirect' => '/admin/admins'
                ]);
                //return redirect()->to('/admin/users');
            } else {
                // Redirigimos a la página de usuarios con una alerta
                // Mostramos un mensaje de error de datos, si hay uno
                $this->data['message'] = $this->validation->getErrors() ? $this->validation->listErrors($this->validationListTemplate) : ($this->auth->errors($this->validationListTemplate) ? $this->auth->errors($this->validationListTemplate) : $this->session->getFlashdata('message'));
                //return redirect()->to('/admin/users');
                echo json_encode([
                    'code' => 0,
                    'redirect' => '/admin/admins/add'
                ]);
            }
        }
    }

    public function renderForm()
    {
        $groups = $this->auth->groups()->resultArray();

        $html = '<form class="row g-3 needs-validation" id="modalNewUser" action="' . base_url('admin/users/adduser') . '" method="post" novalidate>';
        $html .= '<div class="col-md-3 position-relative">';
        $html .= form_label(lang('Auth.create_user_fname_label'), 'first_name');
        $html .= form_input('first_name', set_value('first_name'), ['class' => 'form-control', 'required' => 'required']);
        $html .= '<div class="invalid-tooltip">El campo de Primer Nombre es obligatorio</div>';
        $html .= '</div>';
        $html .= '<div class="col-md-2 position-relative">';
        $html .= form_label(lang('Auth.create_user_mname_label'), 'middle_name');
        $html .= form_input('middle_name', set_value('middle_name'), ['class' => 'form-control']);
        $html .= '</div>';
        $html .= '<div class="col-md-3 position-relative">';
        $html .= form_label(lang('Auth.create_user_flname_label'), 'first_last_name');
        $html .= form_input('first_last_name', set_value('first_last_name'), ['class' => 'form-control', 'required' => 'required']);
        $html .= '<div class="invalid-tooltip">El campo de Primer Apellido es obligatorio</div>';
        $html .= '</div>';
        $html .= '<div class="col-md-2 position-relative">';
        $html .= form_label(lang('Auth.create_user_slname_label'), 'second_last_name');
        $html .= form_input('second_last_name', set_value('second_last_name'), ['class' => 'form-control']);
        $html .= '</div>';
        $html .= '<div class="col-md-2 position-relative">';
        $html .= form_label(lang('Auth.create_user_identity_label'), 'identity');
        $html .= form_input('identity', set_value('identity'), ['class' => 'form-control', 'required' => 'required']);
        $html .= '<div class="invalid-tooltip">El campo de Nombre de Usuario es obligatorio</div>';
        $html .= '</div>';
        $html .= '<div class="col-md-2 position-relative">';
        $html .= form_label(lang('Auth.create_user_email_label'), 'email');
        $html .= form_input('email', set_value('email'), ['class' => 'form-control', 'required' => 'required'], 'email');
        $html .= '<div class="invalid-tooltip">El campo de Correo es obligatorio</div>';
        $html .= '</div>';
        $html .= '<div class="col-md-2 position-relative">';
        $html .= form_label(lang('Auth.create_user_password_label'), 'password');
        $html .= form_password('password', set_value('password'), ['class' => 'form-control', 'required' => 'required']);
        $html .= '<div class="invalid-tooltip">El campo de Contraseña es obligatorio</div>';
        $html .= '</div>';
        $html .= '<div class="col-md-2 position-relative" id="check-confirm">';
        $html .= form_label(lang('Auth.create_user_password_confirm_label'), 'password_confirm');
        $html .= form_password('password_confirm', set_value('password_confirm'), ['class' => 'form-control', 'required' => 'required']);
        $html .= '<div class="invalid-tooltip">El campo de Confirmar Contraseña es obligatorio</div>';
        $html .= '</div>';
        $html .= '<div class="col-md-2 position-relative">';
        $html .= form_label(lang('Auth.create_user_phone_label'), 'phone');
        $html .= form_input('phone', set_value('phone'), ['class' => 'form-control', 'required' => 'required']);
        $html .= '<div class="invalid-tooltip">El campo de Teléfono es obligatorio</div>';
        $html .= '</div>';
        $gender_options = [
            '' => 'Seleccionar',
            1 => 'Masculino',
            2 => 'Femenino',
            3 => 'Otro',
        ];
        $nationality_options = [
            '' => 'Seleccionar',
            1 => 'Venezolano(a)',
            2 => 'Extranjero(a)',
        ];
        $html .= '<div class="col-md-2 position-relative">';
        $html .= form_label(lang('Auth.create_user_gender_label'), 'gender');
        $html .= form_dropdown('gender', $gender_options, '', ['class' => 'form-select', 'required' => 'required']);
        $html .= '<div class="invalid-tooltip">El campo de Género es obligatorio</div>';
        $html .= '</div>';
        $html .= '<div class="col-md-2 position-relative">';
        $html .= form_label(lang('Auth.create_user_nationality_label'), 'nationality');
        $html .= form_dropdown('nationality', $nationality_options, '', ['class' => 'form-select', 'required' => 'required']);
        $html .= '<div class="invalid-tooltip">El campo de Nacionalidad es obligatorio</div>';
        $html .= '</div>';
        $options = [
            '1'  => lang('Site.FormInputAdministrators'),
            '2'    => lang('Site.FormInputTechnicians'),
            '3'  => lang('Site.FormInputManagers'),
            '4' => lang('Site.FormInputUsers'),
        ];
        // Grupos
        $html .= '<div class="col-12 position-relative">';
        $html .= '<div>';
        foreach ($groups as $group) {
            $group_id       = $group['id'];
            $group_name     = $group['name'];
            $group_desc     = $group['description'];

            $html .= '<div class="form-check form-check-inline">';
            $html .= form_input('groups[]', $group_name, ['class' => 'form-check-input', 'id' => 'group' . $group_id, 'data-check' => $group_name], 'checkbox');
            $html .= form_label($group_desc, 'group' . $group_id, ['class' => 'form-check-label']);
            $html .= '</div>';
        }

        $html .= '<div class="invalid-tooltip" id="groupError">Debe seleccionar al menos un grupo</div>';
        $html .= '</div>';
        $html .= '</div>';

        $html .= '<div class="d-grid gap-2 d-md-flex justify-content-md-end">';
        $html .= form_button('', '<i class="bi bi-x-lg me-1 align-middle"></i> ' . lang('Site.GlobalClose'), ['class' => 'btn btn-success me-2 fw-medium', 'data-bs-dismiss' => 'modal']);
        $data = [
            'name'    => 'submit',
            'id'      => 'addNewUser',
            'class'   => 'btn btn-primary fw-medium',
            'type'    => 'submit',
            'content' => '<i class="bi bi-check-lg me-1 align-middle"></i> ' . lang('Site.GlobalSave'),
        ];
        $html .= form_button($data);
        $html .= '</div>';
        $html .= form_hidden('company', $this->siteconfig->name);
        $html .= form_hidden('photo', 'assets/profiles/default.png');
        $html .= '</form>';

        return $html;
    }
}
