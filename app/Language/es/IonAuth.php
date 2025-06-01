<?php

/**
 * Name:     Ion Auth Lang - Spanish
 *
 * Author:   Wilfrido García Espinosa
 *           contacto@wilfridogarcia.com
 *           @wilfridogarcia
 *
 * Location: http://github.com/benedmunds/ion_auth/
 *
 * Created:  05.04.2010
 *
 * Description:  Spanish language file for Ion Auth messages and errors
 *
 */

return [
	// Account Creation
	'account_creation_successful'			=> 'Cuenta creada correctamente.',
	'account_creation_unsuccessful'			=> 'No se ha podido crear la cuenta',
	'account_creation_duplicate_email' 	    => 'Email en uso o inválido',
	'account_creation_duplicate_identity'	=> 'Nombre de usuario en uso o inválido',
	'account_creation_missing_defaultGroup' => 'No se ha especificado grupo por defecto',
	'account_creation_invalid_defaultGroup' => 'Nombre de grupo no válido',

	// Password
	'password_change_successful'			=> 'Contraseña renovada correctamente.',
	'password_change_unsuccessful' 	  	    => 'No se ha podido cambiar la contraseña',
	'forgot_password_successful'			=> 'Nueva contraseña enviada por correo',
	'forgot_password_unsuccessful'			=> 'No se ha podido crear una nueva contraseña',

	// Activation
	'activate_successful'                    => 'Cuenta activada correctamente.',
	'activate_unsuccessful'                  => 'No se ha podido activar la cuenta',
	'deactivate_successful'                  => 'Cuenta desactivada correctamente.',
	'deactivate_unsuccessful'                => 'No se ha podido desactivar la cuenta',
	'activation_email_successful'            => 'Correo de activación enviado',
	'activation_email_unsuccessful'          => 'No se ha podido enviar el correo de activación',
	'deactivate_current_user_unsuccessful' 	 => 'No puede desactivarse usted mismo.',

	// Login / Logout
	'login_successful'                       => 'Sesión iniciada correctamente. Bienvenido!',
	'login_unsuccessful'                     => 'No se ha podido iniciar sesión. Por favor verifique sus credenciales.',
	'login_unsuccessful_not_active'          => 'Cuenta inactiva',
	'login_timeout'                          => 'Temporalmente bloqueado. Vuelva a intentarlo luego dentro de 10 minutos.',
	'logout_successful'                      => 'Sesión finalizada correctamente. Hasta luego!',

	// Account Changes
	'update_successful'                      => 'Información de la cuenta actualizada correctamente.',
	'update_unsuccessful'                    => 'No se ha podido actualizar la información de la cuenta.',
	'delete_successful'                      => 'Usuario eliminado',
	'delete_unsuccessful'                    => 'No se ha podido eliminar el usuario.',

	// Groups
	'group_creation_successful'              => 'Grupo creado',
	'group_already_exists'                   => 'Nombre de grupo en uso',
	'group_update_successful'                => 'Grupo actualizado',
	'group_delete_successful'                => 'Grupo borrado',
	'group_delete_unsuccessful'              => 'Imposible borrar grupo',
	'group_delete_notallowed'                => 'No se puede borrar el grupo de administradores',
	'group_name_required'                    => 'Se requiere un nombre de grupo',
	'group_name_admin_not_alter'             => 'El nombre del grupo de administradores no puede ser modificado',

	// Activation Email
	'emailActivation_subject'               => 'Activación de la cuenta',
	'emailActivate_heading'                 => 'Cuenta activada para %s',
	'emailActivate_subheading'              => 'Por favor, haga click en este enlace para %s.',
	'emailActivate_link'                    => 'Activa tu cuenta',

	// Forgot Password Email
	'email_forgotten_password_subject'       => 'Verificación de contraseña olvidada',
	'emailForgotPassword_heading'          => 'Resetea contraseña para %s',
	'emailForgotPassword_subheading'       => 'Por favor, haga click en este enlace para %s.',
	'emailForgotPassword_link'             => 'Resetea tu contraseña',
];
