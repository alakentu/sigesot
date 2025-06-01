<?php

/**
 * @var \App\Libraries\Template $template
 * @var \App\Models\Settings $settings
 */
$datatable      = isset($datatable) ? 'datatables,' : '';
$header_icon    = isset($header_icon) ? $header_icon : '';
$header_title   = isset($header_title) ? $header_title : '';
$page_subtitle  = isset($page_subtitle) ? $page_subtitle : '';

echo doctype('html5');
?>
<html lang="<?php echo $template->language; ?>" data-theme="saas" data-layout="horizontal" data-topbar="light" data-sidebar-size="lg" data-sidebar="light" data-sidebar-image="none" data-preloader="disable">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="<?php echo $settings->metadesc; ?>">
    <meta name="keywords" content="<?php echo $settings->metakey; ?>">
    <meta name="author" content="<?php echo $settings->author; ?>">
    <meta name="generator" content="Personal Framework v1.0.0'">
    <meta name="docsearch:language" content="<?php echo $template->language; ?>">
    <meta name="docsearch:version" content="1.0.0">
    <title><?php echo $page_title; ?></title>
    <link rel="canonical" href="<?php echo current_url(); ?>">
    <?php if ($template->isClient('site') || $template->isClient('login')) : ?>
        <script src="<?php echo base_url('assets/js/layout.js'); ?>"></script>
    <?php endif; ?>
    <?php echo $template->load_headers(); ?>
</head>
<body<?php echo $template->bodyclass; ?>>
    <?php if ($template->isClient('site') || $template->isClient('login')) : ?>
        <div class="auth-page-wrapper pt-5">
            <div class="auth-one-bg-position auth-one-bg" id="auth-particles">
                <div class="bg-overlay"></div>

                <div class="shape">
                    <svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 1440 120">
                        <path d="M 0,36 C 144,53.6 432,123.2 720,124 C 1008,124.8 1296,56.8 1440,40L1440 140L0 140z"></path>
                    </svg>
                </div>
            </div>

            <div class="auth-page-content">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="text-center mt-sm-5 mb-4 text-white-50">
                                <div>
                                    <a href="/" class="d-inline-block auth-logo">
                                        <img src="<?php echo base_url('assets/images/logo_light.svg'); ?>" alt="" height="30">
                                    </a>
                                </div>
                                <p class="mt-3 fs-15 fw-medium">Inicio de Sesión al Sistema</p>
                            </div>
                        </div>
                    </div>

                    <div class="row justify-content-center">

                    <?php elseif ($template->isClient('site') && $template->isClient('register')) : ?>
                        <div class="auth-page-wrapper pt-5">
                            <div class="auth-one-bg-position auth-one-bg" id="auth-particles">
                                <div class="bg-overlay"></div>

                                <div class="shape">
                                    <svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 1440 120">
                                        <path d="M 0,36 C 144,53.6 432,123.2 720,124 C 1008,124.8 1296,56.8 1440,40L1440 140L0 140z"></path>
                                    </svg>
                                </div>
                            </div>

                            <div class="auth-page-content">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="text-center mt-sm-5 mb-4 text-white-50">
                                                <div>
                                                    <a href="/" class="d-inline-block auth-logo">
                                                        <img src="<?php echo base_url('assets/images/logo_light.svg'); ?>" alt="" height="30">
                                                    </a>
                                                </div>
                                                <p class="mt-3 fs-15 fw-medium">Registro de Cuentas de Usuarios</p>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row justify-content-center">

                                    <?php elseif ($template->isClient('admin')) : ?>
                                        <div id="layout-wrapper">
                                            <?php echo $template->load_layout('topbar'); ?>
                                            <?php echo $template->load_layout('navbar'); ?>

                                            <div class="main-content">
                                                <div class="page-content">
                                                    <div class="container-fluid">
                                                        <?php if ($template->view != 'view-dashboard') : ?>
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                                                                        <h4 class="mb-sm-0"><?php echo ($page_title) ? $page_title : ''; ?></h4>

                                                                        <?php echo $breadcrumb; ?>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        <?php endif; ?>
                                                        <div class="row">
                                                        <?php endif; ?>