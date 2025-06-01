<?php

/**
 * @var \App\Libraries\Template $template
 * @var \App\Models\Settings $settings
 * @var \CodeIgniter\HTTP\URI $uri
 * @var \CodeIgniter\Session\Session $session
 * @var \App\Libraries\Auth $auth
 */
?>
<aside id="sidebar" class="js-sidebar">
	<div class="h-100">
		<div class="sidebar-logo">
			<a href="javascript:void(0);">
				<?php echo $settings->name; ?>
			</a>
		</div>
		<ul class="sidebar-nav">
			<li class="sidebar-header">
				ADMINISTRACIÓN
			</li>
			<li class="sidebar-item">
				<a class="sidebar-link index" href="<?php echo site_url('/admin'); ?>">
					<i class="bi bi-grid pe-2"></i>
					Escritorio
				</a>
			</li>

			<?php if ($auth->isAdmin()) : ?>
				<li class="sidebar-item">
					<a class="sidebar-link collapsed" href="javascript:void(0);" data-bs-target="#collapseAdmins" data-bs-toggle="collapse" aria-expanded="false">
						<i class="bi bi-person-vcard pe-2"></i>
						Administrativo
					</a>
					<ul id="collapseAdmins" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
						<li class="sidebar-item">
							<a class="adminslist add edit deactive update sidebar-link" href="<?php echo site_url('admin/admins/adminslist'); ?>">
								Gestión de Administradores
							</a>
						</li>
						<li class="sidebar-item">
							<a class="users add edit deactive update sidebar-link" href="<?php echo site_url('admin/admins/users'); ?>">
								Gestión de Usuarios
							</a>
						</li>
						<li class="sidebar-item">
							<a class="reports add edit deactive update sidebar-link" href="<?php echo site_url('admin/admins/reports'); ?>">
								Reportes Generales
							</a>
						</li>
					</ul>
				</li>
			<?php endif; ?>

			<?php if ($auth->isAdmin() || $session->get('access') == 'manager' || $session->get('access') == 'users') : ?>
				<li class="sidebar-header">GESTIÓN MEDICA</li>

				<li class="sidebar-item">
					<a class="sidebar-link collapsed" href="javascript:void(0);" data-bs-target="#collapseWorkers" data-bs-toggle="collapse" aria-expanded="false">
						<i class="bi bi-person-gear"></i>
						Medicina
					</a>
					<ul id="collapseWorkers" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
						<li class="sidebar-item">
							<a class="specialties add_emp edit_emp active_emp deact_emp sidebar-link" href="<?php echo site_url('admin/healthcare/specialties'); ?>">
								Especialidades Médicas
							</a>
						</li>
						<li class="sidebar-item">
							<a class="specialists add_perm edit_perm sidebar-link" href="<?php echo site_url('admin/healthcare/specialists'); ?>">
								Especialistas
							</a>
						</li>
						<li class="sidebar-item">
							<a class="appointments add_perm edit_perm sidebar-link" href="<?php echo site_url('admin/healthcare/appointments'); ?>">
								Citas Médicas
							</a>
						</li>
					</ul>
				</li>

				<li class="sidebar-header">LABORATORIO</li>

				<li class="sidebar-item">
					<a class="sidebar-link collapsed" href="javascript:void(0);" data-bs-target="#collapseLabs" data-bs-toggle="collapse" aria-expanded="false">
						<i class="bi bi-clipboard-data"></i>
						Pacientes
					</a>
					<ul id="collapseLabs" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
						<li class="sidebar-item">
							<a class="labstest sidebar-link" href="<?php echo site_url('admin/healthcare/testlabs'); ?>">
								Exámenes y Tarifas
							</a>
						</li>
					</ul>
				</li>

				<li class="sidebar-header">GESTIÓN DE PACIENTES</li>

				<li class="sidebar-item">
					<a class="sidebar-link collapsed" href="javascript:void(0);" data-bs-target="#collapseReports" data-bs-toggle="collapse" aria-expanded="false">
						<i class="bi bi-clipboard-data"></i>
						Pacientes
					</a>
					<ul id="collapseReports" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
						<li class="sidebar-item">
							<a class="profiles sidebar-link" href="<?php echo site_url('admin/patients/profiles'); ?>">
								Perfil del Paciente
							</a>
						</li>
						<li class="sidebar-item">
							<a class="histories sidebar-link" href="<?php echo site_url('admin/patients/histories'); ?>">
								Historias Médicas
							</a>
						</li>
					</ul>
				</li>
			<?php endif; ?>
		</ul>
	</div>
	<div class="sidebar-footer">
		<div class="sidebar-footer-content ps-2 pt-1">
			<div class="sidebar-footer-subtitle">Sesión iniciada como:</div>
			<div class="sidebar-footer-title"><strong><?php echo $session->get('first_name') . ' ' . $session->get('last_name'); ?></strong></div>
		</div>
	</div>
</aside>