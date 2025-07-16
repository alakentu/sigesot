<?php
$month = array("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre");
$date = date('d') . " " . $month[date('n') - 1] . ", " . date('Y');

$allowed = implode(',', $helpdesk->allowed_file_types);
$number = number_format($helpdesk->ticket_attachment_max_size / 1024, 1);
$max_size = $helpdesk->ticket_attachment_max_size;

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
                    <?php endif; ?>

                    <?php if ($canCreateTicket): ?>
                        <?php echo form_open_multipart('admin/saveticket', ['class' => 'needs-validation', 'id' => 'ticketForm']); ?>
                        <?php echo form_hidden('user_id', $auth->getUserId()); ?>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label for="title" class="form-label">Título</label>
                                <input type="text" class="form-control" id="title" name="title" required>
                                <div class="d-flex justify-content-between">
                                    <div id="titleError" class="invalid-feedback">
                                        El título debe tener entre 5 y 100 caracteres (sin contar espacios al inicio/final) - obligatorio
                                    </div>
                                    <div id="titleCounter" class="form-text text-end">
                                        0/100 caracteres válidos
                                    </div>
                                </div>
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
                                <div class="d-flex justify-content-between">
                                    <div id="descriptionError" class="invalid-feedback">
                                        La descripción debe tener al menos 10 caracteres válidos (sin espacios al inicio/final) - obligatorio
                                    </div>
                                    <div id="descriptionCounter" class="form-text text-end">
                                        0 caracteres válidos (mínimo 10)
                                    </div>
                                </div>
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
                                <label for="attachmentsFile" class="form-label">Adjuntos</label>
                                <input class="form-control" type="file" id="attachmentsFile" name="userfile" data-max-size="<?php echo $max_size ?>" accept="<?php echo $allowed ?>">
                                <small class="text-muted">
                                    Máx. <?php echo $number ?>MB por archivo.
                                    Formatos: <?php echo str_replace('application/', '', $allowed) ?>
                                </small>
                            </div>
                        </div>

                        <div class="d-flex justify-content-between align-items-center mt-4">
                            <small class="text-muted">Tickets disponibles: <span id="ticketsCounter"><?php echo $ticketsRemaining ?></span></small>
                            <button type="submit" class="btn btn-soft-primary">
                                <i class="fas fa-plus-circle me-1"></i> Crear Ticket
                            </button>
                        </div>
                        <?php echo form_close(); ?>
                    <?php else: ?>
                        <div class="alert alert-danger mb-0">
                            <?php echo lang('Site.TicketLimitReached', [$helpdesk->max_tickets_per_user]); ?>
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

        const fileInput = document.getElementById("attachmentsFile");

        if (fileInput.files.length > 0) {
            const fileSize = fileInput.files[0].size / 1024 / 1024; // MB
            if (fileSize > 2) {
                e.preventDefault();
                Toastastic.warning("El archivo no debe exceder 2MB", {
                    duration: 3000,
                    position: "top-right",
                    closeButton: true
                });
            }
        }

        // Validación del formulario
        if (!ticketForm.checkValidity()) {
            e.stopPropagation();
            ticketForm.classList.add("was-validated");
            return;
        }

        const formData = new FormData(ticketForm);
        const formAction = ticketForm.getAttribute("action");

        $.ajax({
            url: formAction,
            headers: {"X-Requested-With": "XMLHttpRequest"},
            type: "POST",
            data: formData,
            processData: false,
            contentType: false,
            dataType: "json",
            success: function(response) {
                if (response.success) {
                    // Mostrar notificación de éxito con Toastastic
                    Toastastic.success(response.toast || langTicketCreated, {
                        duration: 3000,
                        position: "top-right",
                        closeButton: true
                    });

                    // Actualizar contador de tickets
                    if (response.ticketsRemaining !== undefined) {
                        $("#ticketsCounter").text(response.ticketsRemaining);

                        // Deshabilitar formulario si llega a cero
                        if (response.ticketsRemaining <= 0) {
                            $("#ticketForm").replaceWith(`<div class="alert alert-warning mb-0">${langTicketLimitReached}</div>`);
                            return;
                        }
                    }

                    // Reset completo del formulario
                    function resetBootstrapForm(form) {

                        // Reset básico del formulario
                        form.reset();

                        // Resetear selects
                        $(form).find("select").each(function() {
                            this.selectedIndex = -1;
                            $(this).removeClass("is-valid is-invalid");
                        });

                        // Resetear checkboxes y radios
                        $(form).find("input[type=\"checkbox\"], input[type=\"radio\"]").prop("checked", false)
                               .removeClass("is-valid is-invalid");

                        // Resetear campos de archivo
                        $(form).find("input[type=\"file\"]").val("")
                               .next(".form-file-text").text("Ningún archivo seleccionado");

                        // Resetear textareas
                        $(form).find("textarea").val("")
                               .removeClass("is-valid is-invalid");

                        // Resetear inputs
                        $(form).find("input[type=\"text\"], input[type=\"email\"], input[type=\"number\"]").val("")
                               .removeClass("is-valid is-invalid");

                        // Remover clases de validación del formulario
                        form.classList.remove("was-validated");

                        // Remover mensajes de validación de Bootstrap
                        $(form).find(".valid-feedback, .invalid-feedback").remove();

                        // Resetear tooltips si los usas
                        if ($.fn.tooltip) {
                            $(form).find("[data-bs-toggle=\"tooltip\"]").tooltip("hide");
                        }
                    }

                    // Aplicar reset completo
                    resetBootstrapForm(ticketForm);
                }
            },
            error: function(xhr) {
                let errorMsg = "Error al procesar la solicitud";

                if (xhr.responseJSON?.error) {
                    errorMsg = xhr.responseJSON.error;
                } else if (xhr.responseJSON?.errors) {
                    errorMsg = Object.values(xhr.responseJSON.errors).join("<br>");
                }

                // Mostrar error con Toastastic
                Toastastic.error(errorMsg, {
                    duration: 5000,
                    position: "top-right",
                    closeButton: true,
                    escapeMarkup: false
                });
            }
        });
    });

    // Validación de tamaño de archivos adjuntos (Bootstrap 5)
    $("#attachments").on("change", function() {
        const maxSize = $(this).data("max-size") * 1024; // Convertir a bytes
        const files = this.files;
        const fileInput = $(this);
        const feedbackElement = fileInput.next(".invalid-feedback");

        for (let i = 0; i < files.length; i++) {
            if (files[i].size > maxSize) {
                // Mostrar error de Bootstrap
                fileInput.addClass("is-invalid");
                if (feedbackElement.length === 0) {
                    fileInput.after("<div class=\"invalid-feedback\">El archivo excede el tamaño permitido</div>");
                }

                // Mostrar notificación con Toastastic
                Toastastic.error(`El archivo ${files[i].name} excede el tamaño permitido`, {
                    duration: 5000,
                    position: "top-right",
                    closeButton: true
                });

                this.value = ""; // Limpiar selección
                break;
            } else {
                fileInput.removeClass("is-invalid");
                feedbackElement.remove();
            }
        }
    });
});

document.addEventListener("DOMContentLoaded", function() {
    const titleInput = document.getElementById("title");
    const descriptionInput = document.getElementById("description");
    const priorityInput = document.getElementById("priority");
    const categoryIdInput = document.getElementById("category_id");
    const titleError = document.getElementById("titleError");
    const descriptionError = document.getElementById("descriptionError");
    const titleCounter = document.getElementById("titleCounter");
    const descriptionCounter = document.getElementById("descriptionCounter");
    const form = document.getElementById("ticketForm");

    form.setAttribute("novalidate", true);

    // Función para contar caracteres válidos (sin espacios al inicio/final)
    function countValidChars(text) {
        return text.trim().length;
    }

    // Validación en tiempo real para el título
    titleInput.addEventListener("input", function() {
        const value = titleInput.value.trim();
        const validLength = countValidChars(titleInput.value);
        const rawLength = titleInput.value.length;

        titleCounter.textContent = `${validLength}/100 caracteres válidos`;

        if (validLength < 5 && rawLength > 0) {
            titleInput.classList.add("is-invalid");
            titleInput.classList.remove("is-valid");
            titleError.textContent = "El título es muy corto (mínimo 5 caracteres válidos)";
        } else if (validLength > 100) {
            titleInput.classList.add("is-invalid");
            titleInput.classList.remove("is-valid");
            titleError.textContent = "El título es muy largo (máximo 100 caracteres válidos)";
        } else if (validLength === 0 && rawLength > 0) {
            titleInput.classList.add("is-invalid");
            titleInput.classList.remove("is-valid");
            titleError.textContent = "Solo espacios no son válidos, escribe contenido real";
        } else if (validLength >= 5 && validLength <= 100) {
            titleInput.classList.remove("is-invalid");
            titleInput.classList.add("is-valid");
            titleError.textContent = "";
            titleCounter.classList.add("text-success");
        } else {
            titleInput.classList.remove("is-invalid");
            titleInput.classList.remove("is-valid");
            titleError.textContent = "";
        }
    });

    // Validación en tiempo real para la descripción
    descriptionInput.addEventListener("input", function() {
        const value = descriptionInput.value.trim();
        const validLength = countValidChars(descriptionInput.value);
        const rawLength = descriptionInput.value.length;

        descriptionCounter.textContent = `${validLength} caracteres válidos (mínimo 10)`;

        if (validLength < 10 && rawLength > 0) {
            descriptionInput.classList.add("is-invalid");
            descriptionInput.classList.remove("is-valid");
            descriptionError.textContent = "La descripción es muy corta (mínimo 10 caracteres válidos)";
        } else if (validLength === 0 && rawLength > 0) {
            descriptionInput.classList.add("is-invalid");
            descriptionInput.classList.remove("is-valid");
            descriptionError.textContent = "Solo espacios no son válidos, escribe contenido real";
        } else if (validLength >= 10) {
            descriptionInput.classList.remove("is-invalid");
            descriptionInput.classList.add("is-valid");
            descriptionError.textContent = "";
            descriptionCounter.classList.add("text-success");
        } else {
            descriptionInput.classList.remove("is-invalid");
            descriptionInput.classList.remove("is-valid");
            descriptionError.textContent = "";
        }
    });

    // Validación en tiempo real para la prioridad
    priorityInput.addEventListener("input", function() {
        if (priorityInput.value === "") {
            priorityInput.classList.add("is-invalid");
            priorityInput.classList.remove("is-valid");
        } else {
            priorityInput.classList.remove("is-invalid");
            priorityInput.classList.add("is-valid");
        }
    });

    // Validación en tiempo real para la categoría
    categoryIdInput.addEventListener("input", function() {
        if (categoryIdInput.value === "") {
            categoryIdInput.classList.add("is-invalid");
            categoryIdInput.classList.remove("is-valid");
        } else {
            categoryIdInput.classList.remove("is-invalid");
            categoryIdInput.classList.add("is-valid");
        }
    });

    // Validación al enviar el formulario
    form.addEventListener("submit", function(e) {
        let isValid = true;
        const titleValidLength = countValidChars(titleInput.value);
        const descValidLength = countValidChars(descriptionInput.value);

        // Validar título
        if (titleValidLength < 5 || titleValidLength > 100) {
            titleInput.classList.add("is-invalid");
            isValid = false;

            if (titleInput.value.trim() === "" && titleInput.value.length > 0) {
                titleError.textContent = "Solo espacios no son válidos, escribe contenido real";
            }
        }

        // Validar descripción
        if (descValidLength < 10) {
            descriptionInput.classList.add("is-invalid");
            isValid = false;

            if (descriptionInput.value.trim() === "" && descriptionInput.value.length > 0) {
                descriptionError.textContent = "Solo espacios no son válidos, escribe contenido real";
            }
        }

        if (!isValid) {
            e.preventDefault();
            e.stopPropagation();

            // Mostrar todos los errores
            form.classList.add("was-validated");
        }
    }, false);
});
');
