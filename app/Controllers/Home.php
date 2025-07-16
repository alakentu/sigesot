<?php

namespace App\Controllers;

class Home extends BaseController
{
    public function login(): string
    {
        $this->data['identity'] = [
            'name'          => 'identity',
            'id'            => 'identity',
            'class'         => 'form-control',
            'type'          => 'text',
            'value'         => set_value('identity'),
            'placeholder'   => 'Ingrese su usuario',
            'required'      => 'required',
        ];

        $this->data['password'] = [
            'name'              => 'password',
            'id'                => 'password',
            'class'             => 'form-control pe-5 password-input',
            'type'              => 'password',
            'placeholder'       => 'Ingese su contraseña',
            'aria-label'        => lang('Auth.login_password_label'),
            'aria-describedby'  => 'button_passwd',
            'required'          => 'required',
        ];

        $this->data['checkbox'] = [
            'name'          => 'remember',
            'id'            => 'remember',
            'class'         => 'form-check-input',
            'data-check'    => 1,
            'data-uncheck'  => 0,
            'value'          => '',
            'type'          => 'checkbox',
        ];

        $this->data['submit'] = [
            'class'   => 'btn btn-success w-100',
            'type'    => 'submit',
            'content' => 'Enviar',
        ];

        $this->data['message'] = $this->validation->getErrors() ? $this->validation->listErrors($this->validationListTemplate) : $this->session->getFlashdata('message');

        return $this->template->render('index', $this->data);
    }
}
