<?= $this->extend('admin/layouts/main') ?>

<?= $this->section('content') ?>
<div class="container-fluid">
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800"><?= $page_title ?></h1>
        <?php if (in_array('members', $userGroups)): ?>
            <a href="<?= base_url('tickets/create') ?>" class="btn btn-primary btn-icon-split">
                <span class="icon text-white-50">
                    <i class="fas fa-plus"></i>
                </span>
                <span class="text">Nuevo Ticket</span>
            </a>
        <?php endif; ?>
    </div>

    <?php if (session('message')): ?>
        <div class="alert alert-success"><?= session('message') ?></div>
    <?php endif; ?>
    <?php if (session('error')): ?>
        <div class="alert alert-danger"><?= session('error') ?></div>
    <?php endif; ?>

    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Listado de Tickets</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="ticketsTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Título</th>
                            <th>Estado</th>
                            <th>Prioridad</th>
                            <th>Categoría</th>
                            <th>Creado</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($tickets as $ticket): ?>
                            <tr>
                                <td><?= $ticket['id'] ?></td>
                                <td><?= esc($ticket['title']) ?></td>
                                <td>
                                    <span class="badge badge-<?= 
                                        $ticket['status'] === 'abierto' ? 'warning' : 
                                        ($ticket['status'] === 'en_progreso' ? 'primary' : 
                                        ($ticket['status'] === 'cerrado' ? 'success' : 'info')) 
                                    ?>">
                                        <?= ucfirst(str_replace('_', ' ', $ticket['status'])) ?>
                                    </span>
                                </td>
                                <td>
                                    <span class="badge badge-<?= 
                                        $ticket['priority'] === 'alta' ? 'danger' : 
                                        ($ticket['priority'] === 'media' ? 'warning' : 'secondary')) 
                                    ?>">
                                        <?= ucfirst($ticket['priority']) ?>
                                    </span>
                                </td>
                                <td>
                                    <?php 
                                        $category = array_filter($categories, function($cat) use ($ticket) {
                                            return $cat['id'] == $ticket['category_id'];
                                        });
                                        echo !empty($category) ? esc(current($category)['name']) : 'Sin categoría';
                                    ?>
                                </td>
                                <td><?= date('d/m/Y H:i', strtotime($ticket['created_at'])) ?></td>
                                <td>
                                    <a href="<?= base_url("tickets/view/{$ticket['id']}") ?>" class="btn btn-sm btn-info">
                                        <i class="fas fa-eye"></i>
                                    </a>
                                    <?php if (in_array('admin', $userGroups) || in_array('manager', $userGroups)): ?>
                                        <a href="<?= base_url("tickets/edit/{$ticket['id']}") ?>" class="btn btn-sm btn-warning">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                    <?php endif; ?>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<?= $this->endSection() ?>

<?= $this->section('scripts') ?>
<script>
    $(document).ready(function() {
        $('#ticketsTable').DataTable({
            "order": [[5, "desc"]],
            "language": {
                "url": "//cdn.datatables.net/plug-ins/1.10.25/i18n/Spanish.json"
            }
        });
    });
</script>
<?= $this->endSection() ?>