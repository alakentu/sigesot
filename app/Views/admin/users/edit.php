<?php
$full_name = $user->first_name . ' ' . $user->middle_name . '<br>' . $user->first_last_name . ' ' . $user->second_last_name;
$user_role = '';
foreach ($groups as $group) {
    $group_id       = $group['id'];
    $group_name     = $group['name'];
    $group_desc     = $group['description'];

    foreach ($currentGroups as $current) {
        if ($group_id == $current->id) {
            $user_role .= '<span class="badge bg-success">' . $group_desc . '</span><br>';
        }
    }
}
?>

<div class="col-12">
    <div class="row position-relative mx-n4 mt-4">
        <div class="profile-wid-bg profile-setting-img">
            <img src="<?php echo base_url('assets/images/profile-bg.jpg'); ?>" class="profile-wid-img" alt="">
        </div>
    </div>

    <?php if (isset($message)) : ?>
        <div class="row">
            <div id="infoMessage"><?php echo $message; ?></div>
        </div>
    <?php endif; ?>

    <div class="row">
        <div class="col-xxl-3">
            <div class="card mt-n5">
                <div class="card-body p-4">
                    <div class="text-center">
                        <div class="profile-user position-relative d-inline-block mx-auto  mb-4">
                            <img src="<?php echo site_url($user->photo); ?>" class="rounded-circle avatar-xl img-thumbnail user-profile-image" alt="user-profile-image">
                        </div>
                        <h5 class="fs-16 mb-1"><?php echo $full_name; ?></h5>
                        <p class="text-muted mb-0"><?php echo $user_role; ?></p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xxl-9">
            <div class="card mt-xxl-n5">
                <div class="card-header">
                    <ul class="nav nav-tabs-custom rounded card-header-tabs border-bottom-0" role="tablist">
                        <li class="nav-item" role="presentation">
                            <a class="nav-link text-body active" data-bs-toggle="tab" href="#personalDetails" role="tab" aria-selected="true">
                                <i class="bi bi-person-badge"></i> Detalles Personales
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="card-body p-4">
                    <div class="tab-content">
                        <div id="personalDetails" class="tab-pane active show" role="tabpanel">
                            <?php echo form_open(uri_string(), ['class' => 'needs-validation', 'id' => 'editUserForm', 'novalidate' => 'novalidate']); ?>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="mb-3">
                                        <?php echo form_label(lang('Auth.create_user_fname_label'), 'first_name'); ?>
                                        <?php echo form_input('first_name', set_value('first_name', $user->first_name ?: ''), ['class' => 'form-control', 'required' => 'required']); ?>
                                        <div class="invalid-tooltip">El campo de Primer Nombre es obligatorio</div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="mb-3">
                                        <?php echo form_label(lang('Auth.create_user_mname_label'), 'middle_name'); ?>
                                        <?php echo form_input('middle_name', set_value('middle_name', $user->middle_name ?: ''), ['class' => 'form-control']); ?>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="mb-3">
                                        <?php echo form_label(lang('Auth.create_user_flname_label'), 'first_last_name'); ?>
                                        <?php echo form_input('first_last_name', set_value('first_last_name', $user->first_last_name ?: ''), ['class' => 'form-control', 'required' => 'required']); ?>
                                        <div class="invalid-tooltip">El campo de Primer Apellido es obligatorio</div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="mb-3">
                                        <?php echo form_label(lang('Auth.create_user_slname_label'), 'second_last_name'); ?>
                                        <?php echo form_input('second_last_name', set_value('second_last_name', $user->second_last_name ?: ''), ['class' => 'form-control']); ?>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="mb-3">
                                        <?php echo form_label(lang('Auth.create_user_identity_label'), 'identity'); ?>
                                        <?php echo form_input('identity', set_value('identity', $user->username ?: ''), ['class' => 'form-control']); ?>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="mb-3">
                                        <?php echo form_label(lang('Auth.create_user_email_label'), 'email'); ?>
                                        <?php echo form_input('email', set_value('email', $user->email ?: ''), ['class' => 'form-control']); ?>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="mb-3">
                                        <?php echo form_label(lang('Auth.create_user_phone_label'), 'phone'); ?>
                                        <?php echo form_input('phone', set_value('phone', $user->phone ?: ''), ['class' => 'form-control']); ?>
                                    </div>
                                </div>
                                <?php
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
                                ?>
                                <div class="col-lg-6">
                                    <div class="mb-3">
                                        <?php echo form_label(lang('Auth.create_user_gender_label'), 'gender'); ?>
                                        <?php echo form_dropdown('gender', $gender_options, set_value('gender', $user->gender ?: ''), ['class' => 'form-select']); ?>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="mb-3">
                                        <?php echo form_label(lang('Auth.create_user_nationality_label'), 'nationality'); ?>
                                        <?php echo form_dropdown('nationality', $nationality_options, set_value('nationality', $user->nationality ?: ''), ['class' => 'form-select']); ?>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="mb-3">
                                        <?php echo form_label(lang('Auth.create_user_password_label'), 'password'); ?>
                                        <?php echo form_input('password', '', ['class' => 'form-control']); ?>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="mb-3">
                                        <?php echo form_label(lang('Auth.create_user_password_confirm_label'), 'password_confirm'); ?>
                                        <?php echo form_input('password_confirm', '', ['class' => 'form-control']); ?>
                                    </div>
                                </div>
                                <?php
                                if ($auth->isAdmin()):
                                ?>
                                    <div class="col-lg-6 position-relative">
                                        <div class="mb-3">
                                            <p class="form-label fw-normal"><?php echo lang('Auth.edit_user_groups_heading'); ?></p>
                                            <div class="d-inline-flex py-2">
                                                <?php
                                                foreach ($groups as $group) {
                                                    $group_id       = $group['id'];
                                                    $group_name     = $group['name'];
                                                    $group_desc     = $group['description'];
                                                    $checked        = '';

                                                    foreach ($currentGroups as $current) {
                                                        if ($group_id == $current->id) {
                                                            $checked .= 'checked="checked"';
                                                            break;
                                                        }
                                                    }
                                                ?>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="checkbox" id="<?php echo 'group' . $group_id; ?>" name="groups[]" value="<?php echo $group_id; ?>" data-checking="<?php echo $group_id; ?>" id="<?php echo 'group' . $group_id; ?>" <?php echo $checked; ?>>
                                                        <label class="form-check-label" for="<?php echo 'group' . $group_id; ?>"><?php echo htmlspecialchars($group_desc, ENT_QUOTES, 'UTF-8'); ?></label>
                                                    </div>
                                                <?php
                                                }
                                                ?>
                                            </div>
                                        </div>
                                    </div>
                                <?php endif; ?>
                                <div class="d-grid gap-2 d-md-flex justify-content-md-start mt-3">
                                    <div class="mb-3">
                                        <?php
                                        $button = [
                                            'name'    => 'submit',
                                            'id'      => 'addNewUser',
                                            'class'   => 'btn btn-primary fw-medium',
                                            'type'    => 'submit',
                                            'content' => '<i class="bi bi-check-lg me-1 align-middle"></i> ' . lang('Site.GlobalSave'),
                                        ];
                                        echo form_button($button);
                                        ?>
                                    </div>
                                </div>

                            </div>
                            <?php
                            echo form_hidden('company', $siteconfig->name);
                            echo form_hidden('id', $user->id);
                            echo form_close(); ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>