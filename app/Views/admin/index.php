<?php
$month = array("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre");
$date = date('d') . " " . $month[date('n') - 1] . ", " . date('Y');

/**
 * @var \App\Libraries\Template $template
 * @var \App\Models\Settings $settings
 */
?>
<div class="col">
    <div class="h-100">
        <div class="row mb-3 pb-1">
            <div class="col-12">
                <div class="d-flex align-items-lg-center flex-lg-row flex-column">
                    <?php echo $template->welcome; ?>

                    <div class="mt-3 mt-lg-0">
                        <form action="javascript:void(0);">
                            <div class="row g-3 mb-0 align-items-center">
                                <div class="col-sm-auto">
                                    <div class="input-group">
                                        <input type="text"
                                            class="form-control border-0 dash-filter-picker shadow"
                                            data-provider="flatpickr" data-range-date="true"
                                            data-date-format="d M, Y"
                                            data-default-date="<?php echo $date; ?>">
                                        <div
                                            class="input-group-text bg-primary border-primary text-white">
                                            <i class="bi bi-calendar3"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <!-- total de solicitudes -->
            <div class="col-xl-3 col-md-6">
                <div class="card card-animate">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div class="flex-grow-1 overflow-hidden">
                                <p class="text-uppercase fw-medium text-muted text-truncate mb-0">
                                    Solicitudes
                                </p>
                            </div>
                            <div class="flex-shrink-0">
                                <h5 class="text-success fs-14 mb-0">
                                    <i class="bi bi-arrow-up-right fs-13 align-middle"></i>
                                    +16.24 %
                                </h5>
                            </div>
                        </div>
                        <div class="d-flex align-items-end justify-content-between mt-4">
                            <div>
                                <h4 class="fs-22 fw-semibold ff-secondary mb-4">
                                    $<span class="counter-value" data-target="559.25">0</span>k
                                </h4>
                                <a href="" class="text-decoration-underline text-muted">
                                    Ver todas las solicitudes
                                </a>
                            </div>
                            <div class="avatar-sm flex-shrink-0">
                                <span class="avatar-title bg-success-subtle rounded fs-3">
                                    <i class="bi bi-coin text-success"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- total de usuarios -->
            <div class="col-xl-3 col-md-6">
                <div class="card card-animate">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div class="flex-grow-1 overflow-hidden">
                                <p class="text-uppercase fw-medium text-muted text-truncate mb-0">
                                    Usuarios
                                </p>
                            </div>
                            <div class="flex-shrink-0">
                                <h5 class="text-danger fs-14 mb-0">
                                    <i class="bi bi-arrow-down-right fs-13 align-middle"></i>
                                    -3.57 %
                                </h5>
                            </div>
                        </div>
                        <div class="d-flex align-items-end justify-content-between mt-4">
                            <div>
                                <h4 class="fs-22 fw-semibold ff-secondary mb-4">
                                    <span class="counter-value" data-target="36894">0</span>
                                </h4>
                                <a href="" class="text-decoration-underline text-muted">
                                    Ver todos los usuarios
                                </a>
                            </div>
                            <div class="avatar-sm flex-shrink-0">
                                <span class="avatar-title bg-info-subtle rounded fs-3">
                                    <i class="bi bi-people text-info"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- algo aquí -->
            <div class="col-xl-3 col-md-6">
                <div class="card card-animate">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div class="flex-grow-1 overflow-hidden">
                                <p class="text-uppercase fw-medium text-muted text-truncate mb-0">
                                    Customers
                                </p>
                            </div>
                            <div class="flex-shrink-0">
                                <h5 class="text-success fs-14 mb-0">
                                    <i class="bi bi-arrow-up-right fs-13 align-middle"></i>
                                    +29.08 %
                                </h5>
                            </div>
                        </div>
                        <div class="d-flex align-items-end justify-content-between mt-4">
                            <div>
                                <h4 class="fs-22 fw-semibold ff-secondary mb-4"><span
                                        class="counter-value" data-target="183.35">0</span>M
                                </h4>
                                <a href="" class="text-decoration-underline text-muted">See
                                    details</a>
                            </div>
                            <div class="avatar-sm flex-shrink-0">
                                <span class="avatar-title bg-warning-subtle rounded fs-3">
                                    <i class="bi bi-person-circle text-warning"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- otra cosa aquí -->
            <div class="col-xl-3 col-md-6">
                <div class="card card-animate">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div class="flex-grow-1 overflow-hidden">
                                <p
                                    class="text-uppercase fw-medium text-muted text-truncate mb-0">
                                    My Balance</p>
                            </div>
                            <div class="flex-shrink-0">
                                <h5 class="text-muted fs-14 mb-0">
                                    +0.00 %
                                </h5>
                            </div>
                        </div>
                        <div class="d-flex align-items-end justify-content-between mt-4">
                            <div>
                                <h4 class="fs-22 fw-semibold ff-secondary mb-4">$<span
                                        class="counter-value" data-target="165.89">0</span>k
                                </h4>
                                <a href="" class="text-decoration-underline text-muted">Withdraw
                                    money</a>
                            </div>
                            <div class="avatar-sm flex-shrink-0">
                                <span class="avatar-title bg-primary-subtle rounded fs-3">
                                    <i class="bi bi-wallet text-primary"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <!-- Sección de creación de tickets (añadir al dashboard existente) -->
            <div class="card mb-4">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h5>Crear Nuevo Ticket</h5>
                    <span id="ticket-counter" class="badge bg-primary-subtle text-primary">
                        <?php echo user_tickets_count() ?> / 3 tickets usados
                    </span>
                </div>
                <div class="card-body">
                    <form id="ticket-create-form" action="<?php echo base_url('admin/tickets/store') ?>" method="POST">
                        <?php echo csrf_field() ?>

                        <div class="mb-3">
                            <label for="title" class="form-label">Título</label>
                            <input type="text" class="form-control" id="title" name="title" required>
                        </div>

                        <div class="mb-3">
                            <label for="description" class="form-label">Descripción</label>
                            <textarea class="form-control" id="description" name="description" rows="3" required></textarea>
                        </div>

                        <div class="mb-3">
                            <label for="priority" class="form-label">Prioridad</label>
                            <select class="form-select" id="priority" name="priority">
                                <option value="baja">Baja</option>
                                <option value="media" selected>Media</option>
                                <option value="alta">Alta</option>
                            </select>
                        </div>

                        <button type="submit" class="btn btn-primary" id="submit-btn">Crear Ticket</button>
                    </form>
                </div>
            </div>

            <!-- Modal de confirmación (éxito/error) -->
            <div class="modal fade" id="ticket-modal" tabindex="-1" aria-hidden="true">
                <!-- Contenido dinámico desde JS -->
            </div>
        </div>

        <div class="row"></div>

        <div class="row"></div>
    </div>
</div>