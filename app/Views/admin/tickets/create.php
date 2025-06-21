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

    <?php if (session('errors')): ?>
        <div class="alert alert-danger">
            <ul class="mb-0">
                <?php foreach (session('errors') as $error): ?>
                    <li><?= esc($error) ?></li>
                <?php endforeach; ?>
            </ul>
        </div>
    <?php endif; ?>

    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">
                Tickets disponibles hoy: <?= $ticketsRemaining ?>/3
            </h6>
        </div>
        <div class="card-body">
            <form action="<?= base_url('tickets/create') ?>" method="post" enctype="multipart/form-data">
                <?= csrf_field() ?>

                <div class="form-group">
                    <label for="title">Título del Ticket *</label>
                    <input type="text" class="form-control <?= session('errors.title') ? 'is-invalid' : '' ?>"
                        id="title" name="title" value="<?= old('title') ?>" required>
                    <small class="form-text text-muted">Describa brevemente el problema</small>
                </div>

                <div class="form-group">
                    <label for="category_id">Categoría *</label>
                    <select class="form-control <?= session('errors.category_id') ? 'is-invalid' : '' ?>"
                        id="category_id" name="category_id" required>
                        <option value="">Seleccione una categoría</option>
                        <?php foreach ($categories as $category): ?>
                            <option value="<?= $category['id'] ?>"
                                <?= old('category_id') == $category['id'] ? 'selected' : '' ?>>
                                <?= esc($category['name']) ?>
                            </option>
                        <?php endforeach; ?>
                    </select>
                </div>

                <div class="form-group">
                    <label for="priority">Prioridad *</label>
                    <select class="form-control <?= session('errors.priority') ? 'is-invalid' : '' ?>"
                        id="priority" name="priority" required>
                        <option value="media" <?= old('priority') == 'media' ? 'selected' : '' ?>>Media</option>
                        <option value="alta" <?= old('priority') == 'alta' ? 'selected' : '' ?>>Alta</option>
                        <option value="baja" <?= old('priority') == 'baja' ? 'selected' : '' ?>>Baja</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="description">Descripción detallada *</label>
                    <textarea class="form-control <?= session('errors.description') ? 'is-invalid' : '' ?>"
                        id="description" name="description" rows="5" required><?= old('description') ?></textarea>
                    <small class="form-text text-muted">Describa el problema con el mayor detalle posible</small>
                </div>

                <div class="form-group">
                    <label for="attachments">Adjuntos (Opcional)</label>
                    <input type="file" class="form-control-file" id="attachments" name="attachments[]" multiple>
                    <small class="form-text text-muted">
                        Puedes subir múltiples archivos (máx. 5MB cada uno). Formatos permitidos: JPG, PNG, PDF, DOC, DOCX
                    </small>
                </div>

                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-icon-split">
                        <span class="icon text-white-50">
                            <i class="fas fa-save"></i>
                        </span>
                        <span class="text">Crear Ticket</span>
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
<?= $this->endSection() ?>