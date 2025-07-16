<div class="col-md-8 col-lg-6 col-xl-5">
    <div class="card mt-4">
        <div class="card-body p-4">
            <div class="text-center mt-2">
                <h5 class="text-primary">Bienvenido!</h5>
                <p class="text-muted">Inicie sesión para acceder al sistema.</p>
            </div>

            <div class="p-2 mt-4">
                <?php if (!empty(session()->getFlashdata('error'))) : ?>
                    <div class="alert alert-danger" role="alert">
                        <strong> Error! </strong> <?= session()->getFlashdata('error') ?>
                    </div>
                <?php endif; ?>

                <?php echo form_open('admin/auth/login', ['id' => 'loginform']); ?>
                <div class="mb-3">
                    <?php echo form_label(lang('Auth.login_identity_label'), 'identity', ['class' => 'form-label']); ?>
                    <?php echo form_input($identity); ?>
                </div>

                <div class="mb-3">
                    <div class="float-end">
                        <a href="<?php echo base_url('admin/auth/forgot_password'); ?>" class="text-muted">
                            <?php echo lang('Auth.login_forgot_password'); ?>
                        </a>
                    </div>
                    <?php echo form_label(lang('Auth.login_password_label'), 'password', ['class' => 'form-label']); ?>
                    <div class="position-relative auth-pass-inputgroup mb-3">
                        <?php echo form_input($password); ?>
                        <button class="btn btn-link position-absolute end-0 top-0 text-decoration-none text-muted password-addon" type="button" id="password-addon">
                            <i class="bi bi-eye align-middle" id="toggle-password" data-bs-toggle="tooltip" data-bs-title="Mostrar contraseña"></i>
                        </button>
                    </div>
                </div>

                <div class="mb-3 form-check">
                    <?php echo form_checkbox($checkbox); ?>
                    <?php echo form_label(lang('Auth.login_remember_label'), 'remember', ['class' => 'form-check-label']); ?>
                </div>

                <div class="mt-4">
                    <?php echo form_button($submit); ?>
                </div>
                <?php echo form_close(); ?>
            </div>
        </div>
    </div>

    <div class="mt-4 text-center">
        <p class="mb-0">
            No tiene cuenta aún? <a href="<?php echo base_url('admin/auth/register'); ?>" class="fw-semibold text-primary text-decoration-underline">Regístrese</a>
        </p>
    </div>
</div>