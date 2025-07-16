<?php

namespace App\Controllers\Admin;

use App\Controllers\Admin\AdminController;

class Auth extends AdminController
{
	/**
	 * Acceso de usuarios al sistema
	 *
	 * @return string|\CodeIgniter\HTTP\RedirectResponse
	 */
	public function login()
	{
		$this->data['page-title'] = lang('Auth.login_heading');

		// Validación del formulario de acceso
		$this->validation->setRule('identity', str_replace(':', '', lang('Auth.login_identity_label')), 'required');
		$this->validation->setRule('password', str_replace(':', '', lang('Auth.login_password_label')), 'required');

		if ($this->request->getPost() && $this->validation->withRequest($this->request)->run()) {
			// Verifica si el usuario está iniciando sesión
			// Verifica s el usuario marco la opción de "recordarme"
			$remember = (bool)$this->request->getVar('remember');

			if ($this->auth->login($this->request->getVar('identity'), $this->request->getVar('password'), $remember)) {
				// Si el acceso es correcto
				// redirecciona a la página de inicio del sistema
				$this->session->setFlashdata('message', $this->auth->messages());
				return redirect()->to('/admin')->withCookies();
			} else {
				// Si el acceso no es correcto
				// redirecciona a la página de inicio de sesión
				$this->session->setFlashdata('message', $this->auth->errors($this->validationListTemplate));
				return redirect()->to(site_url())->withInput();
			}
		} else {
			// El usuario no está iniciando sesión, por lo que se muestra la página de inicio de sesión.
			// Establezca un mensaje de error de datos, si hay uno
			$this->data['message'] = $this->validation->getErrors() ? $this->validation->listErrors($this->validationListTemplate) : $this->session->getFlashdata('message');

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
				'required'      	=> 'required',
			];

			$this->data['checkbox'] = [
				'name'          => 'remember',
				'id'            => 'remember',
				'class'         => 'form-check-input',
				'data-check'    => 1,
				'data-uncheck'  => 0,
				'value'  		=> '',
				'type'          => 'checkbox',
			];

			$this->data['submit'] = [
				'class'   => 'btn btn-success w-100',
				'type'    => 'submit',
				'content' => 'Enviar',
			];

			return $this->template->render(site_url(), $this->data);
		}
	}

	/**
	 * Cierre de sesión de usuarios
	 *
	 * @return \CodeIgniter\HTTP\RedirectResponse
	 */
	public function logout()
	{
		$this->data['title'] = 'Logout';

		// Cierra la sesión del usuario
		$this->auth->logout();

		// Redirige a la página de acceso al sistema
		$this->session->setFlashdata('message', $this->auth->messages());
		return redirect()->to(site_url())->withCookies();
	}

	public function register()
	{
		//
	}

	public function forgot_password()
	{
		//
	}
}
