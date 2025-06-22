<?php
foreach ($tickets as &$ticket) {
    // Normalización robusta de valores
    $normalizedStatus = mb_strtolower(trim($ticket['status']));
    $normalizedPriority = mb_strtolower(trim($ticket['priority']));

    // Asignación DIRECTA al array del ticket
    $ticket['status_class'] = match ($normalizedStatus) {
        'abierto' => 'primary',
        'en_progreso', 'en progreso' => 'warning',
        'cerrado' => 'danger',
        default => 'secondary'
    };

    $ticket['priority_class'] = match ($normalizedPriority) {
        'alta' => 'danger',
        'media' => 'info',
        default => 'success'
    };
}

$formatter = new IntlDateFormatter(
    'es_ES',
    IntlDateFormatter::FULL,
    IntlDateFormatter::SHORT,
    'America/Caracas', // Ajusta tu zona horaria
    IntlDateFormatter::GREGORIAN,
    "dd 'DE' MMMM 'DE' yyyy'<br>'hh:mm a"
);

$fecha = new DateTime($ticket['created_at']);
$fechaFormateada = $formatter->format($fecha);

unset($ticket);
?>
<div class="col-12">
    <?php if (isset($message)) : ?>
        <div id="infoMessage"><?php echo $message; ?></div>
    <?php endif; ?>

    <div class="card">
        <div class="card-header">
            <h5 class="card-title">Listado de Tickets</h5>
            <!-- ESTO NO VA AQUÍ -->
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
            <table id="ticketsTable" class="table table-bordered dt-responsive nowrap table-striped align-middle" style="width:100%">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Título</th>
                        <th scope="col">Estado</th>
                        <th scope="col">Prioridad</th>
                        <th scope="col">Categoría</th>
                        <th scope="col">Creado</th>
                        <th scope="col">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($tickets as $ticket): ?>
                        <tr>
                            <td><?php echo $ticket['id'] ?></td>
                            <td><?php echo esc($ticket['title']) ?></td>
                            <td>
                                <span class="badge bg-<?php echo $ticket['status_class'] ?>-subtle text-<?php echo $ticket['status_class'] ?>">
                                    <?php echo ucwords(str_replace('_', ' ', $ticket['status'])) ?>
                                </span>
                            </td>
                            <td>
                                <span class="badge bg-<?php echo $ticket['priority_class'] ?>">
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
                            <td><?php echo str_replace([' DE ', '<br>'], [' de ', '<br>A las '], $fechaFormateada) ?></td>
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

<?php $template->add_inline('
    $(document).ready(function() {
        let t=new DataTable("#ticketsTable",{
            order:[[5,"desc"]],
            processing:true,
            serverSide:false,
            searching:false,
            ordering:false,
            fixedColumns:true,
            fixedHeader:true,
            pageLength:25,
            lengthMenu:[10,25,50,100],
            responsive:false,
            language:{url:"' . site_url('assets/lang/datatables/' . $template->language . '.json') . '"},
            initComplete:()=>{t.buttons().container().appendTo("#table-data_wrapper .col-md-6:eq(0)")},
            drawCallback:()=>{$("[data-bs-toggle=\"tooltip\"]").tooltip({trigger:"hover",container:"body"})}
        });
        DataTable.Buttons.defaults.dom.button.className="btn btn-outline-primary btn-sm";
    });
'); ?>