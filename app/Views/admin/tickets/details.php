<?php
$formatter = new IntlDateFormatter(
    'es_ES',
    IntlDateFormatter::FULL,
    IntlDateFormatter::SHORT,
    'America/Caracas', // Ajusta tu zona horaria
    IntlDateFormatter::GREGORIAN,
    "dd 'DE' MMMM 'DE' yyyy'<br>'hh:mm a"
);

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

                <div class="card mt-4">
                    <div class="card-header">
                        <h5 class="mb-0">Comentarios</h5>
                    </div>
                    <div class="card-body p-0">
                        <div id="commentsContainer" style="max-height: 400px; overflow-y: auto;"></div>
                    </div>
                </div>

                <div class="card mt-3">
                    <div class="card-body">
                        <form id="commentForm">
                            <div class="mb-3">
                                <textarea class="form-control" name="comment" rows="3" required placeholder="Escribe tu comentario..."></textarea>
                            </div>

                            <?php
                            $userGroups = array_column(array_map(function ($g) {
                                return (array)$g;
                            }, $userGroups), 'name');
                            if (array_intersect(['admin', 'manager', 'technical'], $userGroups)): ?>
                                <div class="form-check mb-3">
                                    <input type="checkbox" class="form-check-input" id="is_internal" name="is_internal" value="true" data-check="true" data-uncheck="false">
                                    <label class="form-check-label" for="is_internal">
                                        <i class="bi bi-lock-fill"></i> Comentario interno (solo equipo)
                                    </label>
                                </div>
                            <?php endif; ?>

                            <button type="submit" class="btn btn-primary">
                                <i class="bi bi-send-fill"></i> Enviar Comentario
                            </button>
                        </form>
                    </div>
                </div>
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

                    <p><span class="text-primary fw-semibold">Solicitante</span>: <?php echo esc($ticket['user_first_name'] . ' ' . $ticket['user_last_name']) ?></p>
                </div>

                <?php if ($ticket['assigned_to']): ?>
                    <div class="mb-3">

                        <p><span class="text-success fw-semibold">Asignado a</span>: <?php echo esc($ticket['assigned_first_name'] . ' ' . $ticket['assigned_last_name']) ?></p>
                    </div>
                <?php endif; ?>

                <?php if (array_intersect(['admin', 'manager', 'technical'], $userGroups) && $usercan['reassign']): ?>
                    <form action="<?php echo base_url("tickets/assign/{$ticket['id']}") ?>" method="post" class="row g-3 mb-4">
                        <?php echo csrf_field() ?>
                        <div class="col-12">
                            <label class="form-label" for="assigned_to">Reasignar ticket a:</label>
                            <select class="form-select" id="assigned_to" name="assigned_to">
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

                <hr>

                <?php if (array_intersect(['admin', 'manager', 'technical'], $userGroups) && $usercan['change_status']): ?>
                    <form action="<?php echo base_url("admin/tickets/updatestatus/{$ticket['id']}") ?>" method="post" class="row g-3 mb-4">
                        <?php echo csrf_field() ?>
                        <div class="input-group mb-3">
                            <label class="input-group-text" for="ticketStatus">Cambiar Estado</label>
                            <select class="form-select" id="ticketStatus" name="status">
                                <option value="abierto" <?php echo $ticket['status'] == 'abierto' ? 'selected="selected"' : '' ?>>Abierto</option>
                                <option value="en_progreso" <?php echo $ticket['status'] == 'en_progreso' ? 'selected="selected"' : '' ?>>En Progreso</option>
                                <option value="en_revision" <?php echo $ticket['status'] == 'en_revision' ? 'selected="selected"' : '' ?>>En Revisión</option>
                                <option value="cerrado" <?php echo $ticket['status'] == 'cerrado' ? 'selected="selected"' : '' ?>>Cerrado</option>
                            </select>
                            <button class="btn btn-outline-secondary" type="submit">Actualizar</button>
                        </div>
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
<?php
$template->add_inline('
$(document).ready(function() {
    // Configuración de Toastify
    function showToast(message, type = "success") {
        const background = type === "success" ? "#28a745" : "#dc3545";

        Toastify({
            text: message,
            duration: 3000,
            close: true,
            gravity: "top",
            position: "right",
            backgroundColor: background,
            stopOnFocus: true
        }).showToast();
    }

    // Función para cargar comentarios
    function loadComments() {
        $.get("' . base_url("admin/tickets/getcomments/{$ticket['id']}") . '", function(response) {
            if (response.success && response.comments) {
                $("#commentsContainer").empty();

                if (response.comments.length === 0) {
                    $("#commentsContainer").html("<div class=\"p-3 text-center text-muted\">No hay comentarios aún</div>");
                    return;
                }

                // Mostrar solo los últimos 5 comentarios
                const lastFive = response.comments.slice(-5);

                lastFive.forEach(comment => {
                    const commentHtml = `
                        <div class="p-3 border-bottom comment-item ${comment.is_internal ? "bg-light-warning" : ""}">
                            <div class="d-flex">
                                <div class="flex-shrink-0">
                                    <img src="' . base_url() . '${comment.photo}" class="rounded-circle" width="40" height="40" alt="Avatar" id="userAvatar">
                                </div>
                                <div class="flex-grow-1 ms-3">
                                    <div class="d-flex justify-content-between">
                                        <h6 class="mb-1">${escapeHtml(comment.first_name + " " + comment.first_last_name)}</h6>
                                        <small class="text-muted">
                                            ${formatDate(comment.created_at)}
                                            ${comment.is_internal ? "<span class=\"badge bg-warning-subtle text-warning ms-2\">Interno</span>" : ""}
                                        </small>
                                    </div>
                                    <p class="mb-0">${escapeHtml(comment.comment).replace(/\n/g, "<br>")}</p>
                                </div>
                            </div>
                        </div>`;

                    $("#commentsContainer").append(commentHtml);
                });

                // Hacer scroll al final
                $("#commentsContainer").scrollTop($("#commentsContainer")[0].scrollHeight);
            }
        }).fail(function() {
            showToast("Error al cargar comentarios", "error");
        });
    }

    // Función para escapar HTML
    function escapeHtml(unsafe) {
        return unsafe
            .replace(/&/g, "&amp;")
            .replace(/</g, "&lt;")
            .replace(/>/g, "&gt;")
            .replace(/"/g, "&quot;")
            .replace(/"/g, "&#039;");
    }

    // Función para formatear fecha
    function formatDate(dateString) {
        const options = {
            day: "2-digit",
            month: "2-digit",
            year: "numeric",
            hour: "2-digit",
            minute: "2-digit"
        };
        return new Date(dateString).toLocaleDateString("es-ES", options);
    }

    // Enviar formulario de comentario
    $("#commentForm").submit(function(e) {
        e.preventDefault();

        const formData = $(this).serialize();

        $.ajax({
            url: "' . base_url("admin/tickets/addcomment/{$ticket['id']}") . '",
            type: "POST",
            dataType: "json",
            data: formData,
            success: function(response) {
            console.log(response);
                if (response.success) {
                    // Resetear formulario
                    $("#commentForm")[0].reset();

                    // Mostrar notificación
                    showToast(response.message || "Comentario agregado");

                    // Recargar comentarios
                    loadComments();
                } else {
                    showToast(response.message || "Error al agregar comentario", "error");
                }
            },
            error: function(xhr) {
                let errorMsg = "Error en la conexión";
                if (xhr.responseJSON && xhr.responseJSON.message) {
                    errorMsg = xhr.responseJSON.message;
                }
                showToast(errorMsg, "error");
            }
        });
    });

    // Cargar comentarios inicialmente
    loadComments();
});
');
