<?php
foreach ($tickets as $ticket) {
    $status = $ticket['status'] === 'abierto' ? 'warning' : ($ticket['status'] === 'en_progreso' ? 'primary' : ($ticket['status'] === 'cerrado' ? 'success' : 'info'));
    $priority = $ticket['priority'] === 'alta' ? 'danger' : ($ticket['priority'] === 'media' ? 'warning' : 'secondary');
}
?>
<div class="col-xl-12">
    <?php if (isset($message)) : ?>
        <div id="infoMessage"><?php echo $message; ?></div>
    <?php endif; ?>

    <div class="card">
        <div class="card-header align-items-center d-flex">
            <h4 class="card-title mb-0 flex-grow-1">Listado de Tickets</h4>
            <?php if (in_array('members', $userGroups)): ?>
                <div class="flex-shrink-0">
                    <div class="form-check form-switch form-switch-right form-switch-md">
                        <a href="<?php echo base_url('tickets/create') ?>" class="btn btn-primary btn-icon-split">
                            <span class="icon text-white-50">
                                <i class="bi bi-plus"></i>
                            </span>
                            <span class="text">Nuevo Ticket</span>
                        </a>
                    </div>
                </div>
            <?php endif; ?>
        </div>

        <div class="card-body">
            <div class="live-preview">
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
                                    <td><?php echo $ticket['id'] ?></td>
                                    <td><?php echo esc($ticket['title']) ?></td>
                                    <td>
                                        <span class="badge text-bg-<?php echo $status ?>">
                                            <?php echo ucfirst(str_replace('_', ' ', $ticket['status'])) ?>
                                        </span>
                                    </td>
                                    <td>
                                        <span class="badge text-bg-<?php echo $priority ?>">
                                            <?php echo ucfirst($ticket['priority']) ?>
                                        </span>
                                    </td>
                                    <td>
                                        <?php
                                        $category = array_filter($categories, function ($cat) use ($ticket) {
                                            return $cat['id'] == $ticket['category_id'];
                                        });
                                        echo !empty($category) ? esc(current($category)['name']) : 'Sin categoría';
                                        ?>
                                    </td>
                                    <td><?php echo date('d-m-Y h:i:s a', strtotime($ticket['created_at'])) ?></td>
                                    <td>
                                        <a href="<?php echo base_url("admin/tickets/view/{$ticket['id']}") ?>" class="btn btn-sm btn-info">
                                            <i class="bi bi-eye"></i> Ver
                                        </a>
                                        <?php if (in_array('admin', $userGroups) || in_array('manager', $userGroups)): ?>
                                            <a href="<?php echo base_url("admin/tickets/edit/{$ticket['id']}") ?>" class="btn btn-sm btn-warning">
                                                <i class="bi bi-pencil"></i> Editar
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
</div>

<?php $template->add_inline('
    $(document).ready(function() {
        let t=new DataTable("#ticketsTable",{
            order:[[5,"asc"]],
            columnDefs:[
                {targets:[0],orderable:!1},
			    {targets:[5],orderable:!0},
			    {targets:[1,2,3,4,6],visible:!0,orderable:!1}
            ],
            processing:!0,
            serverSide:!1,
            ordering:!0,
            fixedColumns:!0,
            stateSave:!0,
            pageLength:25,
            lengthMenu:[10,25,50,100],
            resposive:!0,
            language:{url:"' . site_url('assets/lang/datatables/' . $template->language . '.json') . '"},
            initComplete:()=>{t.buttons().container().appendTo("#table-data_wrapper .col-md-6:eq(0)")},
            drawCallback:()=>{$("[data-bs-toggle=\"tooltip\"]").tooltip({trigger:"hover",container:"body"})}
        });
        DataTable.Buttons.defaults.dom.button.className="btn btn-outline-primary btn-sm";
    });
'); ?>