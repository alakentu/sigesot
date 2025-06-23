<div class="container mt-4">
    <h2>Crear Nuevo Ticket</h2>

    <?php if (session('error')): ?>
        <div class="alert alert-danger"><?php echo session('error') ?></div>
    <?php endif ?>

    <?php if (session('success')): ?>
        <div class="alert alert-success"><?php echo session('success') ?></div>
    <?php endif ?>

    <?php if ($canCreateTicket): ?>
        <form id="ticketForm" method="post" action="<?php echo base_url('tickets/store') ?>">
            <?php echo csrf_field() ?>

            <div class="mb-3">
                <label for="title" class="form-label">Título</label>
                <input type="text" class="form-control" id="title" name="title" required>
            </div>

            <div class="mb-3">
                <label for="description" class="form-label">Descripción</label>
                <textarea class="form-control" id="description" name="description" rows="5" required></textarea>
            </div>

            <div class="mb-3">
                <label for="priority" class="form-label">Prioridad</label>
                <select class="form-select" id="priority" name="priority" required>
                    <option value="low">Baja</option>
                    <option value="medium" selected>Media</option>
                    <option value="high">Alta</option>
                    <option value="critical">Crítica</option>
                </select>
            </div>

            <div class="mb-3">
                <label for="category" class="form-label">Categoría</label>
                <select class="form-select" id="category" name="category" required>
                    <?php foreach ($categories as $category): ?>
                        <option value="<?php echo $category['id'] ?>"><?php echo $category['name'] ?></option>
                    <?php endforeach ?>
                </select>
            </div>

            <button type="submit" class="btn btn-primary">Crear Ticket</button>
        </form>
    <?php else: ?>
        <div class="alert alert-warning">
            Has alcanzado el límite de tickets abiertos (3). Por favor cierra alguno antes de crear uno nuevo.
        </div>
    <?php endif ?>
</div>

<script>
    $(document).ready(function() {
        $('#ticketForm').submit(function(e) {
            e.preventDefault();

            $.ajax({
                url: $(this).attr('action'),
                method: 'POST',
                data: $(this).serialize(),
                success: function(response) {
                    if (response.success) {
                        window.location.href = "<?php echo base_url('tickets') ?>";
                    } else {
                        alert(response.message || 'Error al crear el ticket');
                    }
                },
                error: function() {
                    alert('Error en la conexión');
                }
            });
        });
    });
</script>