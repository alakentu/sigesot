<?php
$welcome = ($session->gender == 'Masculino') ? 'Bienvenido' : 'Bienvenida';
/**
 * @var \App\Libraries\Template $template
 * @var \App\Models\Settings $settings
 */
?>
<header id="page-topbar">
    <div class="layout-width">
        <div class="navbar-header">
            <div class="d-flex">
                <div class="navbar-brand-box horizontal-logo">
                    <a href="<?php echo site_url('admin'); ?>" class="logo logo-dark">
                        <span class="logo-sm">
                            <img src="<?php echo site_url('assets/images/logo-sm.svg'); ?>" alt="" height="22">
                        </span>
                        <span class="logo-lg">
                            <img src="<?php echo site_url('assets/images/logo_dark.svg'); ?>" alt="" height="24">
                        </span>
                    </a>

                    <a href="<?php echo site_url('admin'); ?>" class="logo logo-light">
                        <span class="logo-sm">
                            <img src="<?php echo site_url('assets/images/logo-sm.svg'); ?>" alt="" height="22">
                        </span>
                        <span class="logo-lg">
                            <img src="<?php echo site_url('assets/images/logo_light.svg'); ?>" alt="" height="24">
                        </span>
                    </a>
                </div>

                <button type="button" class="btn btn-sm px-3 fs-16 header-item vertical-menu-btn topnav-hamburger" id="topnav-hamburger-icon">
                    <span class="hamburger-icon">
                        <span></span>
                        <span></span>
                        <span></span>
                    </span>
                </button>
            </div>

            <div class="d-flex align-items-center">
                <div class="dropdown d-md-none topbar-head-dropdown header-item">
                    <button type="button" class="btn btn-icon btn-topbar btn-ghost-secondary rounded-circle" id="page-header-search-dropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="bi bi-search fs-22"></i>
                    </button>
                    <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end p-0" aria-labelledby="page-header-search-dropdown">
                        <form class="p-3">
                            <div class="form-group m-0">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Search ..." aria-label="Recipient's username">
                                    <button class="btn btn-primary" type="submit"><i class="bi bi-search"></i></button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="ms-1 header-item d-none d-sm-flex">
                    <button type="button" class="btn btn-icon btn-topbar btn-ghost-secondary rounded-circle" data-toggle="fullscreen">
                        <i class="bi bi-fullscreen fs-22"></i>
                    </button>
                </div>

                <div class="ms-1 header-item d-none d-sm-flex">
                    <button type="button" class="btn btn-icon btn-topbar btn-ghost-secondary rounded-circle light-dark-mode">
                        <i class="bi bi-moon fs-22"></i>
                    </button>
                </div>

                <div class="dropdown ms-sm-3 header-item topbar-user">
                    <button type="button" class="btn" id="page-header-user-dropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="d-flex align-items-center">
                            <img class="rounded-circle header-profile-user" src="<?php echo $template->avatar; ?>" alt="<?php echo $user_name; ?>">
                            <span class="text-start ms-xl-2">
                                <span class="d-none d-xl-inline-block ms-1 fw-medium user-name-text"><?php echo $template->fullname; ?></span>
                                <span class="d-none d-xl-block ms-1 fs-12 user-name-sub-text"><?php echo $user_role; ?></span>
                            </span>
                        </span>
                    </button>
                    <div class="dropdown-menu dropdown-menu-end">
                        <h6 class="dropdown-header"><?php echo $welcome . ' ' . $user_name; ?>!</h6>
                        <a class="dropdown-item" href="pages-profile"><i class="bi bi-person-circle text-muted fs-16 align-middle me-1"></i> <span class="align-middle">Perfil</span></a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="<?php echo site_url('/admin/auth/logout'); ?>"><i class="bi bi-box-arrow-right text-muted fs-16 align-middle me-1"></i> <span class="align-middle">Salir</span></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>