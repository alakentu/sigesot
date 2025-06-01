<?php if ($template->isClient('site') || $template->isClient('login')) : ?>
    </div>
    </div>
    </div>

    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="text-center">
                        <p class="mb-0 text-muted">
                            &copy; <?php echo date('Y') . ' ' . $settings->name; ?>. Elaborada con <i class="bi bi-heart-fill text-danger"></i> por GM Team
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    </div>

    <div id="toolbarContainer"></div>
<?php elseif ($template->isClient('site') && $template->isClient('register')) : ?>
    </div>
    </div>
    </div>

    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="text-center">
                        <p class="mb-0 text-muted">
                            &copy; <?php echo date('Y') . ' ' . $settings->name; ?>. Elaborada con <i class="bi bi-heart-fill text-danger"></i> por GM Team
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    </div>
    <div id="toolbarContainer"></div>
<?php elseif ($template->isClient('admin')) : ?>
    </div>
    </div>
    </div>

    <footer class="footer">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-6">
                    &copy; <?php echo date('Y') . ' ' . $settings->name; ?>.
                </div>
                <div class="col-sm-6">
                    <div class="text-sm-end d-none d-sm-block">
                        Diseñada & Desarrollada por GM Team. Derechos reservados. Versión <?php echo $settings->version; ?>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    </div>
    <div id="toolbarContainer"></div>
    <?php if ($template->view != 'view-dashboard') : ?>
        <div class="modal fade zoomIn" tabindex="-1" aria-labelledby="sigesotModalLabel" aria-hidden="true" id="adminModal">
            <div class="modal-dialog modal-fullscreen">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title" id="sigesotModalLabel"><?php echo $modal_title; ?></h3>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="<?php echo lang('Site.GlobalClose'); ?>"></button>
                    </div>
                    <div class="modal-body">
                        <p><?php echo $modal_subheading; ?></p>
                        <?php echo $modal_body; ?>
                    </div>
                </div>
            </div>
        </div>
    <?php endif; ?>
    </div>
<?php endif; ?>
<?php
echo $template->inline_script("
var baseUrl = '" . base_url() . "';
var site = '" . site_url() . "';
var url_ajax = '" . site_url('site/ajax_data') . "';
var extend_session = '" . site_url('/admin/auth/extend_session') . "';
var session_logout = '" . site_url('/admin/auth/logout') . "';
var user_lang = navigator.language.substring(0,2);
");
echo $template->load_footer();
?>
</body>

</html>