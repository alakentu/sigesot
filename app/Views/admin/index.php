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
            <div class="card mb-4">
                <div class="card-header">
                    <h5 class="mb-0">Crear Nuevo Ticket</h5>
                </div>
                <div class="card-body">
                    <?php if ($canCreateTicket): ?>
                        <small class="text-muted">
                            Límite: <?php echo $helpdesk->max_tickets_per_user ?> tickets por usuario al día
                        </small>
                        <!-- Resto del formulario -->
                    <?php else: ?>
                        <div class="alert alert-warning">
                            <?php echo str_replace('{0}', $helpdesk->max_tickets_per_user, lang('Site.TicketLimitReached')) ?>
                        </div>
                    <?php endif; ?>

                    <?php if ($canCreateTicket): ?>
                        <form id="ticketForm" class="needs-validation" novalidate>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label for="title" class="form-label">Título</label>
                                    <input type="text" class="form-control" id="title" name="title" required>
                                    <div class="invalid-feedback">Por favor ingrese un título válido (5-100 caracteres)</div>
                                </div>

                                <div class="col-md-6">
                                    <label for="priority" class="form-label">Prioridad</label>
                                    <select class="form-select" id="priority" name="priority" required>
                                        <option value="">Seleccionar...</option>
                                        <option value="alta">Alta</option>
                                        <option value="media">Media</option>
                                        <option value="baja">Baja</option>
                                    </select>
                                    <div class="invalid-feedback">Seleccione una prioridad</div>
                                </div>

                                <div class="col-12">
                                    <label for="description" class="form-label">Descripción</label>
                                    <textarea class="form-control" id="description" name="description" rows="3" required></textarea>
                                    <div class="invalid-feedback">La descripción es requerida (mínimo 10 caracteres)</div>
                                </div>

                                <div class="col-md-6">
                                    <label for="category_id" class="form-label">Categoría</label>
                                    <select class="form-select" id="category_id" name="category_id" required>
                                        <option value="">Seleccionar...</option>
                                        <?php foreach ($categories as $category): ?>
                                            <option value="<?php echo $category->id ?>"><?php echo esc($category->name) ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                    <div class="invalid-feedback">Seleccione una categoría</div>
                                </div>

                                <div class="col-md-6">
                                    <label for="attachments" class="form-label">Adjuntos</label>
                                    <input class="form-control" type="file" id="attachments" name="attachments[]" multiple
                                        data-max-size="<?php echo $helpdesk->ticket_attachment_max_size ?>"
                                        accept="<?php echo implode(',', $helpdesk->allowed_file_types) ?>">
                                    <small class="text-muted">
                                        Máx. <?php echo number_format($helpdesk->ticket_attachment_max_size / 1024, 1) ?>MB por archivo.
                                        Formatos: <?php echo str_replace('application/', '', implode(', ', $helpdesk->allowed_file_types)) ?>
                                    </small>
                                </div>
                            </div>

                            <div class="d-flex justify-content-between align-items-center mt-4">
                                <small class="text-muted">Tickets disponibles: <span id="ticketsCounter"><?php echo $ticketsRemaining ?></span></small>
                                <button type="submit" class="btn btn-soft-primary">
                                    <i class="fas fa-plus-circle me-1"></i> Crear Ticket
                                </button>
                            </div>
                        </form>
                    <?php else: ?>
                        <div class="alert alert-warning mb-0">
                            <?php echo lang('Site.TicketLimitReached') ?>
                        </div>
                    <?php endif; ?>
                </div>
            </div>
        </div>

        <div class="row"></div>

        <div class="row"></div>
    </div>
</div>
<?php
echo $template->inline_script("
const langTicketLimitReached = '" . addslashes($jsLang['ticketLimitReached']) . "';
const langTicketCreated = '" . addslashes($jsLang['ticketCreated']) . "';
");
$template->add_inline('
$(document).ready(function() {
    const ticketForm = document.getElementById("ticketForm");

    ticketForm.addEventListener("submit", function(e) {
        e.preventDefault();

        if (!ticketForm.checkValidity()) {
            e.stopPropagation();
            ticketForm.classList.add("was-validated");
            return;
        }

        const formData = new FormData(ticketForm);

        console.log("Datos enviados:", [...formData].map(([key, val]) => ({key, val})));

        $.ajax({
            url: "' . base_url('admin/saveticket') . '",
            headers: {"X-Requested-With": "XMLHttpRequest"},
            type: "POST",
            data: formData,
            processData: false,
            contentType: false,
            dataType: "json",
            success: function(response) {
                if (response.success) {
                    Toastify({
                        text: response.toast || langTicketCreated,
                        duration: 3000,
                        close: true,
                        gravity: "top",
                        position: "right",
                        backgroundColor: "#4CAF50",
                        className: "toastify-success"
                    }).showToast();

                    // Actualizar contador
                    if (response.ticketsRemaining !== undefined) {
                        $("#ticketsCounter").text(response.ticketsRemaining);

                        // Deshabilitar formulario si llega a cero
                        if (response.ticketsRemaining <= 0) {
                            $("#ticketForm").replaceWith(`<div class="alert alert-warning mb-0">${langTicketLimitReached}</div>`);
                        }
                    }

                    // Resetear formulario
                    ticketForm.reset();
                    ticketForm.classList.remove("was-validated");
                }
            },
            error: function(xhr) {
                let errorMsg = "Error al procesar la solicitud";

                if (xhr.responseJSON?.error) {
                    errorMsg = xhr.responseJSON.error;
                } else if (xhr.responseJSON?.errors) {
                    errorMsg = Object.values(xhr.responseJSON.errors).join("<br>");
                }

                // Mostrar error con Toastify
                Toastify({
                    text: errorMsg,
                    duration: 5000,
                    close: true,
                    gravity: "top",
                    position: "right",
                    backgroundColor: "#f44336",
                    className: "toastify-error",
                    escapeMarkup: false
                }).showToast();
            }
        });
    });

    $("#attachments").on("change", function() {
        const maxSize = $(this).data("max-size") * 1024; // Convertir a bytes
        const files = this.files;

        for (let i = 0; i < files.length; i++) {
            if (files[i].size > maxSize) {
                Toastify({
                    text: `El archivo ${files[i].name} excede el tamaño permitido`,
                    duration: 5000,
                    close: true,
                    gravity: "top",
                    position: "right",
                    backgroundColor: "#f44336",
                    className: "toastify-error"
                }).showToast();
                this.value = ""; // Limpiar selección
                break;
            }
        }
    });
});
');
