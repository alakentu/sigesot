<?php
$status = $ticket['status'] === 'abierto' ? 'warning' : ($ticket['status'] === 'en_progreso' ? 'primary' : ($ticket['status'] === 'cerrado' ? 'success' : 'info'));
$priority = $ticket['priority'] === 'alta' ? 'danger' : ($ticket['priority'] === 'media' ? 'warning' : 'secondary');
?>
<?= $this->extend('admin/layouts/main') ?>

<?= $this->section('content') ?>
<div class="container-fluid">
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800"><?= $page_title ?></h1>
        <a href="<?= base_url('tickets') ?>" class="btn btn-secondary btn-icon-split">
            <span class="icon text-white-50">
                <i class="fas fa-arrow-left"></i>
            </span>
            <span class="text">Volver</span>
        </a>
    </div>

    <?php if (session('message')): ?>
        <div class="alert alert-success"><?= session('message') ?></div>
    <?php endif; ?>
    <?php if (session('error')): ?>
        <div class="alert alert-danger"><?= session('error') ?></div>
    <?php endif; ?>

    <div class="row">
        <div class="col-lg-8">
            <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">Detalles del Ticket</h6>
                    <div class="dropdown no-arrow">
                        <span class="badge badge-<?= $status ?>">
                            <?= ucfirst(str_replace('_', ' ', $ticket['status'])) ?>
                        </span>
                    </div>
                </div>
                <div class="card-body">
                    <h4 class="text-primary"><?= esc($ticket['title']) ?></h4>
                    <p class="mb-4"><?= nl2br(esc($ticket['description'])) ?></p>

                    <div class="row mb-4">
                        <div class="col-md-4">
                            <div class="border-left-primary py-2 px-3">
                                <h6 class="text-primary">Prioridad</h6>
                                <span class="badge badge-<?= $priority ?>">
                                    <?= ucfirst($ticket['priority']) ?>
                                </span>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="border-left-success py-2 px-3">
                                <h6 class="text-success">Categoría</h6>
                                <p><?= esc($ticket['category_name'] ?? 'Sin categoría') ?></p>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="border-left-info py-2 px-3">
                                <h6 class="text-info">Fecha Creación</h6>
                                <p><?= date('d/m/Y H:i', strtotime($ticket['created_at'])) ?></p>
                            </div>
                        </div>
                    </div>

                    <?php if (!empty($attachments)): ?>
                        <div class="mb-4">
                            <h6 class="text-secondary">Archivos Adjuntos</h6>
                            <div class="d-flex flex-wrap">
                                <?php foreach ($attachments as $attachment): ?>
                                    <div class="mr-3 mb-2">
                                        <a href="<?= base_url($attachment['file_path']) ?>"
                                            target="_blank"
                                            class="d-flex align-items-center text-dark">
                                            <i class="fas fa-paperclip mr-2"></i>
                                            <span><?= esc($attachment['file_name']) ?></span>
                                        </a>
                                    </div>
                                <?php endforeach; ?>
                            </div>
                        </div>
                    <?php endif; ?>

                    <hr>

                    <h5 class="mb-3">Comentarios</h5>

                    <div class="mb-4">
                        <?php if (empty($comments)): ?>
                            <p class="text-muted">No hay comentarios aún</p>
                        <?php else: ?>
                            <?php foreach ($comments as $comment): ?>
                                <div class="card mb-3 border-left-<?= $comment['is_internal'] ? 'warning' : 'primary' ?>">
                                    <div class="card-body py-2">
                                        <div class="d-flex justify-content-between">
                                            <h6 class="font-weight-bold">
                                                <?= esc($comment['first_name'] . ' ' . $comment['first_last_name']) ?>
                                            </h6>
                                            <small class="text-muted">
                                                <?= date('d/m/Y H:i', strtotime($comment['created_at'])) ?>
                                                <?php if ($comment['is_internal']): ?>
                                                    <span class="badge badge-warning ml-2">Interno</span>
                                                <?php endif; ?>
                                            </small>
                                        </div>
                                        <p class="mb-0"><?= nl2br(esc($comment['comment'])) ?></p>
                                    </div>
                                </div>
                            <?php endforeach; ?>
                        <?php endif; ?>
                    </div>

                    <form action="<?= base_url("tickets/addComment/{$ticket['id']}") ?>" method="post">
                        <?= csrf_field() ?>
                        <div class="form-group">
                            <label for="comment">Agregar Comentario</label>
                            <textarea class="form-control" id="comment" name="comment" rows="3" required></textarea>
                        </div>
                        <?php if (in_array('admin', $userGroups) || in_array('manager', $userGroups) || in_array('technical', $userGroups)): ?>
                            <div class="form-group form-check">
                                <input type="checkbox" class="form-check-input" id="is_internal" name="is_internal">
                                <label class="form-check-label" for="is_internal">Comentario interno (solo visible para el equipo)</label>
                            </div>
                        <?php endif; ?>
                        <button type="submit" class="btn btn-primary">Enviar Comentario</button>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-lg-4">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Información del Ticket</h6>
                </div>
                <div class="card-body">
                    <div class="mb-3">
                        <h6 class="text-primary">Solicitante</h6>
                        <p><?= esc($ticket['user_first_name'] . ' ' . $ticket['user_last_name']) ?></p>
                    </div>

                    <?php if ($ticket['assigned_to']): ?>
                        <div class="mb-3">
                            <h6 class="text-success">Asignado a</h6>
                            <p><?= esc($ticket['assigned_first_name'] . ' ' . $ticket['assigned_last_name']) ?></p>
                        </div>
                    <?php endif; ?>

                    <?php if (in_array('admin', $userGroups) || in_array('manager', $userGroups)): ?>
                        <form action="<?= base_url("tickets/assign/{$ticket['id']}") ?>" method="post" class="mb-4">
                            <?= csrf_field() ?>
                            <div class="form-group">
                                <label for="assigned_to">Asignar a técnico</label>
                                <select class="form-control" id="assigned_to" name="assigned_to">
                                    <option value="">Seleccionar técnico...</option>
                                    <?php foreach ($technicians as $tech): ?>
                                        <option value="<?= $tech['id'] ?>"
                                            <?= $ticket['assigned_to'] == $tech['id'] ? 'selected' : '' ?>>
                                            <?= esc($tech['first_name'] . ' ' . $tech['first_last_name']) ?>
                                        </option>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-sm btn-success">Asignar</button>
                        </form>
                    <?php endif; ?>

                    <?php if (in_array('admin', $userGroups) || in_array('manager', $userGroups) || in_array('technical', $userGroups)): ?>
                        <form action="<?= base_url("tickets/updateStatus/{$ticket['id']}") ?>" method="post">
                            <?= csrf_field() ?>
                            <div class="form-group">
                                <label for="status">Cambiar Estado</label>
                                <select class="form-control" id="status" name="status">
                                    <option value="abierto" <?= $ticket['status'] == 'abierto' ? 'selected' : '' ?>>Abierto</option>
                                    <option value="en_progreso" <?= $ticket['status'] == 'en_progreso' ? 'selected' : '' ?>>En Progreso</option>
                                    <option value="en_revision" <?= $ticket['status'] == 'en_revision' ? 'selected' : '' ?>>En Revisión</option>
                                    <option value="cerrado" <?= $ticket['status'] == 'cerrado' ? 'selected' : '' ?>>Cerrado</option>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-sm btn-primary">Actualizar Estado</button>
                        </form>
                    <?php endif; ?>
                </div>
            </div>

            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Historial de Cambios</h6>
                </div>
                <div class="card-body">
                    <?php $history = model('TicketHistoryModel')->where('ticket_id', $ticket['id'])->orderBy('changed_at', 'DESC')->findAll(); ?>
                    <?php if (empty($history)): ?>
                        <p class="text-muted">No hay registros de cambios</p>
                    <?php else: ?>
                        <div class="timeline">
                            <?php foreach ($history as $item): ?>
                                <div class="timeline-item">
                                    <div class="timeline-item-marker">
                                        <div class="timeline-item-marker-indicator bg-<?=
                                                                                        $item['field_changed'] == 'status' ? 'primary' : ($item['field_changed'] == 'assigned_to' ? 'success' : 'info')
                                                                                        ?>"></div>
                                    </div>
                                    <div class="timeline-item-content">
                                        <p class="mb-1">
                                            <strong><?= esc($item['field_changed']) ?></strong> cambiado de
                                            "<strong><?= esc($item['old_value']) ?></strong>" a
                                            "<strong><?= esc($item['new_value']) ?></strong>"
                                        </p>
                                        <small class="text-muted">
                                            <?= date('d/m/Y H:i', strtotime($item['changed_at'])) ?>
                                            por <?= esc($item['changed_by_name']) ?>
                                        </small>
                                    </div>
                                </div>
                            <?php endforeach; ?>
                        </div>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </div>
</div>
<?= $this->endSection() ?>

<?= $this->section('styles') ?>
<style>
    .timeline {
        position: relative;
        padding-left: 1rem;
    }

    .timeline-item {
        position: relative;
        padding-bottom: 1.5rem;
    }

    .timeline-item-marker {
        position: absolute;
        left: -1rem;
        width: 2rem;
        text-align: center;
    }

    .timeline-item-marker-indicator {
        display: inline-block;
        width: 12px;
        height: 12px;
        border-radius: 100%;
    }

    .timeline-item-content {
        padding-left: 0.5rem;
    }
</style>
<?= $this->endSection() ?>