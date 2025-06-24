<?php
$formatter = new IntlDateFormatter(
    'es_ES',
    IntlDateFormatter::FULL,
    IntlDateFormatter::SHORT,
    'America/Caracas', // Ajusta tu zona horaria
    IntlDateFormatter::GREGORIAN,
    "dd 'DE' MMMM 'DE' yyyy'<br>'hh:mm a"
);

foreach ($tickets as &$ticket) {
    // Validar y normalizar el estado
    $status = $ticket['status'] ?? null;
    $normalizedStatus = $status ? mb_strtolower(trim($status)) : 'desconocido';

    // Validar y normalizar la prioridad
    $priority = $ticket['priority'] ?? null;
    $normalizedPriority = $priority ? mb_strtolower(trim($priority)) : 'baja'; // Valor por defecto

    // Asignar clases CSS con valores por defecto seguros
    $ticket['status_class'] = match ($normalizedStatus) {
        'abierto' => 'primary',
        'en_progreso', 'en progreso' => 'warning',
        'cerrado' => 'danger',
        default => 'secondary' // Para estados desconocidos o nulos
    };

    $ticket['priority_class'] = match ($normalizedPriority) {
        'alta' => 'danger',
        'media' => 'info',
        default => 'success' // Para 'baja' y cualquier otro caso
    };

    // Asegurar que los campos existan incluso si eran nulos
    $ticket['status'] = $normalizedStatus;
    $ticket['priority'] = $normalizedPriority;

    $fecha = new DateTime($ticket['created_at']);
    $fechaFormateada = $formatter->format($fecha);
}

unset($ticket);
?>
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800"><?php echo $page_title ?></h1>
    <a href="<?php echo base_url('admin/tickets') ?>" class="btn btn-secondary btn-icon-split">
        <span class="icon text-white-50">
            <i class="fas fa-arrow-left"></i>
        </span>
        <span class="text">Volver</span>
    </a>
</div>

<?php if (isset($message)) : ?>
    <div id="infoMessage"><?php echo $message; ?></div>
<?php endif; ?>

<div class="row">
    <div class="col-xl-8">
        <div class="card mb-5">
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                <h6 class="m-0 font-weight-bold text-primary">Detalles del Ticket</h6>
                <div class="dropdown no-arrow">
                    <span class="badge bg-<?php echo $ticket['status_class'] ?>-subtle text-<?php echo $ticket['status_class'] ?>">
                        <?php echo ucfirst(str_replace('_', ' ', $ticket['status'])) ?>
                    </span>
                </div>
            </div>
            <div class="card-body">
                <h4 class="text-primary"><?php echo esc($ticket['title']) ?></h4>
                <p class="mb-4"><?php echo nl2br(esc($ticket['description'])) ?></p>

                <div class="row mb-4">
                    <div class="col-md-4">
                        <div class="border-left-primary py-2 px-3">
                            <h6 class="text-primary">Prioridad</h6>
                            <span class="badge bg-<?php echo $ticket['priority_class'] ?>">
                                <?php echo ucfirst($ticket['priority']) ?>
                            </span>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="border-left-success py-2 px-3">
                            <h6 class="text-success">Categoría</h6>
                            <p><?php echo esc($ticket['category_name'] ?? 'Sin categoría') ?></p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="border-left-info py-2 px-3">
                            <h6 class="text-info">Fecha Creación</h6>
                            <p><?php echo str_replace([' DE ', '<br>'], [' de ', '<br>A las '], $fechaFormateada) ?></p>
                        </div>
                    </div>
                </div>

                <?php if (!empty($attachments)): ?>
                    <div class="mb-4">
                        <h6 class="text-secondary">Archivos Adjuntos</h6>
                        <div class="d-flex flex-wrap">
                            <?php foreach ($attachments as $attachment): ?>
                                <div class="mr-3 mb-2">
                                    <a href="<?php echo base_url($attachment['file_path']) ?>"
                                        target="_blank"
                                        class="d-flex align-items-center text-dark">
                                        <i class="fas fa-paperclip mr-2"></i>
                                        <span><?php echo esc($attachment['file_name']) ?></span>
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
                            <div class="card mb-3 border-left-<?php echo $comment['is_internal'] ? 'warning' : 'primary' ?>">
                                <div class="card-body py-2">
                                    <div class="d-flex justify-content-between">
                                        <h6 class="font-weight-bold">
                                            <?php echo esc($comment['first_name'] . ' ' . $comment['first_last_name']) ?>
                                        </h6>
                                        <small class="text-muted">
                                            <?php echo date('d/m/Y H:i', strtotime($comment['created_at'])) ?>
                                            <?php if ($comment['is_internal']): ?>
                                                <span class="badge text-bg-warning ml-2">Interno</span>
                                            <?php endif; ?>
                                        </small>
                                    </div>
                                    <p class="mb-0"><?php echo nl2br(esc($comment['comment'])) ?></p>
                                </div>
                            </div>
                        <?php endforeach; ?>
                    <?php endif; ?>
                </div>

                <form action="<?php echo base_url("tickets/addComment/{$ticket['id']}") ?>" method="post">
                    <?php echo csrf_field() ?>
                    <div class="form-group mb-3">
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

    <div class="col-xl-4">
        <div class="card mb-5">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Información del Ticket</h6>
            </div>
            <div class="card-body">
                <div class="mb-3">
                    <h6 class="text-primary">Solicitante</h6>
                    <p><?php echo esc($ticket['user_first_name'] . ' ' . $ticket['user_last_name']) ?></p>
                </div>

                <?php if ($ticket['assigned_to']): ?>
                    <div class="mb-3">
                        <h6 class="text-success">Asignado a</h6>
                        <p><?php echo esc($ticket['assigned_first_name'] . ' ' . $ticket['assigned_last_name']) ?></p>
                    </div>
                <?php endif; ?>

                <?php if (in_array('admin', $userGroups) || in_array('manager', $userGroups)): ?>
                    <form action="<?php echo base_url("tickets/assign/{$ticket['id']}") ?>" method="post" class="mb-4">
                        <?php echo csrf_field() ?>
                        <div class="form-group">
                            <label for="assigned_to">Asignar a técnico</label>
                            <select class="form-control" id="assigned_to" name="assigned_to">
                                <option value="">Seleccionar técnico...</option>
                                <?php foreach ($technicians as $tech): ?>
                                    <option value="<?php echo $tech['id'] ?>"
                                        <?php echo $ticket['assigned_to'] == $tech['id'] ? 'selected' : '' ?>>
                                        <?php echo esc($tech['first_name'] . ' ' . $tech['first_last_name']) ?>
                                    </option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-sm btn-success">Asignar</button>
                    </form>
                <?php endif; ?>

                <?php if (in_array('admin', $userGroups) || in_array('manager', $userGroups) || in_array('technical', $userGroups)): ?>
                    <form action="<?php echo base_url("tickets/updateStatus/{$ticket['id']}") ?>" method="post">
                        <?php echo csrf_field() ?>
                        <div class="form-group">
                            <label for="status">Cambiar Estado</label>
                            <select class="form-control" id="status" name="status">
                                <option value="abierto" <?php echo $ticket['status'] == 'abierto' ? 'selected' : '' ?>>Abierto</option>
                                <option value="en_progreso" <?php echo $ticket['status'] == 'en_progreso' ? 'selected' : '' ?>>En Progreso</option>
                                <option value="en_revision" <?php echo $ticket['status'] == 'en_revision' ? 'selected' : '' ?>>En Revisión</option>
                                <option value="cerrado" <?php echo $ticket['status'] == 'cerrado' ? 'selected' : '' ?>>Cerrado</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-sm btn-primary">Actualizar Estado</button>
                    </form>
                <?php endif; ?>
            </div>
        </div>

        <div class="card mb-5">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Historial de Cambios</h6>
            </div>
            <div class="card-body">
                <?php if (empty($history)): ?>
                    <p class="text-muted">No hay registros de cambios</p>
                <?php else: ?>
                    <ul class="timeline">
                        <?php foreach ($history as $item):
                            $textColor = $item['field_changed'] == 'status' ? 'primary' : ($item['field_changed'] == 'assigned_to' ? 'success' : 'info');
                            //date_default_timezone_set('America/Caracas');
                            $formatter = new IntlDateFormatter(
                                'es_ES',
                                IntlDateFormatter::FULL,
                                IntlDateFormatter::NONE,
                                'America/Caracas',
                                IntlDateFormatter::GREGORIAN,
                                "EEE d, MMM y"
                            );
                            $date = new DateTimeImmutable($item['changed_at']);
                            $fechaFormateada = $formatter->format($date);
                        ?>
                            <li data-bg-color="<?php echo $textColor ?>">
                                <span class="text-<?php echo $textColor ?>">Cambio: <?php echo ucfirst($item['field_changed']) ?></span>
                                <span class="float-end text-<?php echo $textColor ?>"><?php echo ucwords($fechaFormateada) ?></span>
                                <p class="mb-1">
                                    Se ha cambiado el <strong><?php echo esc($item['field_changed']) ?></strong> de
                                    "<strong><?php echo esc($item['old_value']) ?></strong>" a
                                    "<strong><?php echo esc($item['new_value']) ?></strong>"
                                </p>
                            </li>
                        <?php endforeach; ?>
                    </ul>
                <?php endif; ?>
            </div>
        </div>
    </div>
</div>