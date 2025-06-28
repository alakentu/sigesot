<?php

/**
 * @var \App\Libraries\Template $template
 * @var \App\Models\Settings $settings
 * @var \CodeIgniter\HTTP\URI $uri
 * @var \CodeIgniter\Session\Session $session
 * @var \App\Libraries\Auth $auth
 */
?>
<div class="app-menu navbar-menu">
    <div class="navbar-brand-box">
        <a href="<?php echo base_url('admin'); ?>" class="logo logo-dark">
            <span class="logo-sm">
                <img src="<?php echo base_url('assets/images/logo-sm.svg'); ?>" alt="" height="22">
            </span>
            <span class="logo-lg">
                <img src="<?php echo base_url('assets/images/logo_dark.svg'); ?>" alt="" height="24">
            </span>
        </a>

        <a href="<?php echo base_url('admin'); ?>" class="logo logo-light">
            <span class="logo-sm">
                <img src="<?php echo base_url('assets/images/logo-sm.svg'); ?>" alt="" height="22">
            </span>
            <span class="logo-lg">
                <img src="<?php echo base_url('assets/images/logo_light.svg'); ?>" alt="" height="24">
            </span>
        </a>
        <button type="button" class="btn btn-sm p-0 fs-20 header-item float-end btn-vertical-sm-hover"
            id="vertical-hover">
            <i class="ri-record-circle-line"></i>
        </button>
    </div>

    <div id="scrollbar">
        <div class="container-fluid">

            <div id="two-column-menu">
            </div>
            <ul class="navbar-nav" id="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link menu-link" href="<?php echo base_url('admin'); ?>">
                        <i class="bi bi-columns"></i> Escritorio
                    </a>
                </li>

                <?php if ($session->access === 'admin' || $session->access === 'technical') : ?>
                    <li class="nav-item">
                        <a class="nav-link menu-link" href="<?php echo base_url('admin/tickets'); ?>">
                            <i class="bi bi-headset"></i> Solicitudes
                        </a>
                    </li>
                <?php endif; ?>

                <?php if ($session->access === 'admin') : ?>
                    <li class="nav-item">
                        <a class="nav-link menu-link" href="<?php echo base_url('admin/inventory'); ?>">
                            <i class="bi bi-boxes"></i> Inventario
                        </a>
                    </li>
                <?php endif; ?>

                <?php if ($session->access === 'admin' || $session->access === 'manager') : ?>
                    <li class="nav-item">
                        <a class="nav-link menu-link" href="#sidebarAdministration" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="sidebarAdministration">
                            <i class="bi bi-incognito"></i> Administración
                        </a>
                        <div class="collapse menu-dropdown" id="sidebarAdministration">
                            <ul class="nav nav-sm flex-column">
                                <?php if ($session->access === 'admin') : ?>
                                    <li class="nav-item">
                                        <a href="<?php echo base_url('admin/users'); ?>" class="nav-link">
                                            <i class="bi bi-people"></i> Usuarios
                                        </a>
                                    </li>
                                <?php endif; ?>
                                <li class="nav-item">
                                    <a href="<?php echo base_url('admin/reports'); ?>" class="nav-link">
                                        <i class="bi bi-file-spreadsheet"></i> Reportes
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="<?php echo base_url('admin/auditory'); ?>" class="nav-link">
                                        <i class="bi bi-journal-text"></i> Auditoría
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link menu-link" id="navbarDropdownNotifications" href="#dropdownUI" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="sidebarUI">
                            <i class="bi bi-bell"></i> Notificaciones
                            <span id="notification-badge" class="badge badge-pill bg-danger d-none">0</span>
                        </a>
                        <div class="collapse menu-dropdown mega-dropdown-menu" id="dropdownUI">
                            <div class="row">
                                <div class="col-lg-4">
                                    <ul class="nav nav-sm flex-column">
                                        <li class="nav-item" id="notifications-container">
                                            <span class="dropdown-item">Cargando notificaciones...</span>
                                        </li>
                                        <li class="nav-item">
                                            <hr class="dropdown-divider">
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link text-center small" href="<?php echo base_url('admin/tickets/notifications') ?>">Ver todas</a>
                                        </li>
                                </div>
                            </div>
                        </div>
                    </li>
                <?php endif; ?>
            </ul>
        </div>
    </div>
    <div class="sidebar-background"></div>
</div>

<div class="vertical-overlay"></div>