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
<div class="col-12">
    <?php if (isset($message)) : ?>
        <div id="infoMessage"><?php echo $message; ?></div>
    <?php endif; ?>

    <div class="row">
        <!-- Total de Tickets (todos los estados) -->
        <div class="col-xl-3 col-md-6">
            <div class="card card-animate">
                <div class="card-body">
                    <div class="d-flex align-items-center">
                        <div class="flex-grow-1 overflow-hidden">
                            <p class="text-uppercase fw-medium text-muted text-truncate mb-0">
                                Total Tickets
                            </p>
                        </div>
                        <div class="flex-shrink-0">
                            <h5 class="<?= $ticketStats['total']['trend'] > 0 ? 'text-success' : 'text-danger' ?> fs-14 mb-0">
                                <i class="bi bi-arrow-<?= $ticketStats['total']['trend'] > 0 ? 'up' : 'down' ?>-right fs-13 align-middle"></i>
                                <?= abs($ticketStats['total']['trend']) ?>%
                            </h5>
                        </div>
                    </div>
                    <div class="d-flex align-items-end justify-content-between mt-4">
                        <div>
                            <h4 class="fs-22 fw-semibold ff-secondary mb-4">
                                <span class="counter-value" data-target="<?= $ticketStats['total']['count'] ?>">0</span>
                            </h4>
                            <a href="<?= base_url('admin/tickets') ?>" class="text-decoration-underline text-muted">
                                Ver todos los tickets
                            </a>
                        </div>
                        <div class="avatar-sm flex-shrink-0">
                            <span class="avatar-title bg-primary-subtle rounded fs-3">
                                <i class="bi bi-ticket-detailed text-primary"></i>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Tickets abiertos hoy -->
        <div class="col-xl-3 col-md-6">
            <div class="card card-animate">
                <div class="card-body">
                    <div class="d-flex align-items-center">
                        <div class="flex-grow-1 overflow-hidden">
                            <p class="text-uppercase fw-medium text-muted text-truncate mb-0">
                                Tickets Hoy
                            </p>
                        </div>
                        <div class="flex-shrink-0">
                            <h5 class="<?= $ticketStats['today']['trend'] > 0 ? 'text-success' : 'text-danger' ?> fs-14 mb-0">
                                <i class="bi bi-arrow-<?= $ticketStats['today']['trend'] > 0 ? 'up' : 'down' ?>-right fs-13 align-middle"></i>
                                <?= abs($ticketStats['today']['trend']) ?>%
                            </h5>
                        </div>
                    </div>
                    <div class="d-flex align-items-end justify-content-between mt-4">
                        <div>
                            <h4 class="fs-22 fw-semibold ff-secondary mb-4">
                                <span class="counter-value" data-target="<?= $ticketStats['today']['count'] ?>">0</span>
                            </h4>
                            <a href="<?= base_url('admin/tickets?filter=today') ?>" class="text-decoration-underline text-muted">
                                Ver tickets de hoy
                            </a>
                        </div>
                        <div class="avatar-sm flex-shrink-0">
                            <span class="avatar-title bg-warning-subtle rounded fs-3">
                                <i class="bi bi-hourglass-split text-warning"></i>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Tickets resueltos hoy -->
        <div class="col-xl-3 col-md-6">
            <div class="card card-animate">
                <div class="card-body">
                    <div class="d-flex align-items-center">
                        <div class="flex-grow-1 overflow-hidden">
                            <p class="text-uppercase fw-medium text-muted text-truncate mb-0">
                                Resueltos Hoy
                            </p>
                        </div>
                        <div class="flex-shrink-0">
                            <h5 class="<?= $ticketStats['solved']['trend'] > 0 ? 'text-success' : 'text-danger' ?> fs-14 mb-0">
                                <i class="bi bi-arrow-<?= $ticketStats['solved']['trend'] > 0 ? 'up' : 'down' ?>-right fs-13 align-middle"></i>
                                <?= abs($ticketStats['solved']['trend']) ?>%
                            </h5>
                        </div>
                    </div>
                    <div class="d-flex align-items-end justify-content-between mt-4">
                        <div>
                            <h4 class="fs-22 fw-semibold ff-secondary mb-4">
                                <span class="counter-value" data-target="<?= $ticketStats['solved']['count'] ?>">0</span>
                            </h4>
                            <a href="<?= base_url('admin/tickets?filter=solved_today') ?>" class="text-decoration-underline text-muted">
                                Ver resueltos
                            </a>
                        </div>
                        <div class="avatar-sm flex-shrink-0">
                            <span class="avatar-title bg-success-subtle rounded fs-3">
                                <i class="bi bi-check-circle text-success"></i>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Total de usuarios registrados -->
        <div class="col-xl-3 col-md-6">
            <div class="card card-animate">
                <div class="card-body">
                    <div class="d-flex align-items-center">
                        <div class="flex-grow-1 overflow-hidden">
                            <p class="text-uppercase fw-medium text-muted text-truncate mb-0">
                                Usuarios
                            </p>
                        </div>
                        <div class="flex-shrink-0">
                            <h5 class="<?= $userStats['trend'] > 0 ? 'text-success' : 'text-danger' ?> fs-14 mb-0">
                                <i class="bi bi-arrow-<?= $userStats['trend'] > 0 ? 'up' : 'down' ?>-right fs-13 align-middle"></i>
                                <?= abs($userStats['trend']) ?>%
                            </h5>
                        </div>
                    </div>
                    <div class="d-flex align-items-end justify-content-between mt-4">
                        <div>
                            <h4 class="fs-22 fw-semibold ff-secondary mb-4">
                                <span class="counter-value" data-target="<?= $userStats['count'] ?>">0</span>
                            </h4>
                            <a href="<?= base_url('admin/users') ?>" class="text-decoration-underline text-muted">
                                Ver todos los usuarios
                            </a>
                        </div>
                        <div class="avatar-sm flex-shrink-0">
                            <span class="avatar-title bg-info-subtle rounded fs-3">
                                <i class="bi bi-people text-info"></i>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="card mb-4">
            <div class="card-header d-flex justify-content-between align-items-center">
                <h5 class="mb-0">Tickets Recientes</h5>
                <span class="badge bg-secondary-subtle text-secondary">
                    Activos: <?php echo $activeTicketsCount ?> / <?php echo $helpdesk->max_tickets_per_user ?>
                </span>
            </div>
            <div class="card-body">
                <?php if (!empty($recentTickets)): ?>
                    <div class="list-group">
                        <?php foreach ($recentTickets as $ticket): ?>
                            <a href="<?php echo base_url('admin/tickets/view/' . $ticket['ticket_id']) ?>"
                                class="list-group-item list-group-item-action">
                                <div class="d-flex w-100 justify-content-between">
                                    <h6 class="mb-1">#<?php echo $ticket['ticket_id'] ?> - <?php echo esc($ticket['title']) ?></h6>
                                    <small class="text-<?php echo $ticket['priority'] === 'alta' ? 'danger' : ($ticket['priority'] === 'media' ? 'warning' : 'success') ?>">
                                        <?php echo ucfirst($ticket['priority']) ?>
                                    </small>
                                </div>
                                <small class="text-muted">
                                    Creado: <?php echo date('d M Y', strtotime($ticket['ticket_created_at'])) ?>
                                    • Estado: <?php echo ucfirst($ticket['status']) ?>
                                </small>
                            </a>
                        <?php endforeach; ?>
                    </div>
                <?php else: ?>
                    <div class="alert alert-info mb-0">No hay tickets recientes</div>
                <?php endif; ?>
            </div>
        </div>
    </div>

    <div class="card">
        <div class="card-header d-flex align-items-center">
            <h5 class="card-title mb-0 flex-grow-1">Listado de Tickets</h5>
            <div>
                <a href="<?php echo base_url('admin/tickets') ?>" class="btn btn-sm btn-secondary <?= empty($currentFilter) ? 'active' : '' ?>">
                    Todos
                </a>
                <a href="<?php echo base_url('admin/tickets?filter=today') ?>" class="btn btn-sm btn-outline-primary <?= $currentFilter === 'today' ? 'active' : '' ?>">
                    Abiertos Hoy
                </a>
                <a href="<?php echo base_url('admin/tickets?filter=solved_today') ?>" class="btn btn-sm btn-outline-success <?= $currentFilter === 'solved_today' ? 'active' : '' ?>">
                    Resueltos Hoy
                </a>
                <a href="<?php echo base_url('admin/tickets?filter=open') ?>" class="btn btn-sm btn-outline-warning <?= $currentFilter === 'open' ? 'active' : '' ?>">
                    Abiertos
                </a>
                <a href="<?php echo base_url('admin/tickets?filter=in_progress') ?>" class="btn btn-sm btn-outline-info <?= $currentFilter === 'in_progress' ? 'active' : '' ?>">
                    En Progreso
                </a>
                <a href="<?php echo base_url('admin/tickets?filter=closed') ?>" class="btn btn-sm btn-outline-danger <?= $currentFilter === 'closed' ? 'active' : '' ?>">
                    Cerrados
                </a>

                <!-- ESTO NO VA AQUÍ -->
                <?php //if (in_array('members', array_column($userGroups, 'name'))): 
                ?>
                <div class="flex-shrink-0">
                    <!--div class="form-check form-switch form-switch-right form-switch-md">
                            <a href="<?php //echo base_url('admin/index') 
                                        ?>" class="btn btn-primary btn-icon-split">
                                <span class="icon text-white-50">
                                    <i class="bi bi-plus"></i>
                                </span>
                                <span class="text">Nuevo Ticket</span>
                            </a>
                        </div-->
                </div>
                <?php //endif; 
                ?>
            </div>
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
                                //$category = array_filter($categories, function ($cat) use ($ticket) {
                                //    return $cat->id == $ticket['category_id'];
                                //});

                                //echo '<pre>';
                                //print_r($category->name);
                                //echo '</pre>';
                                //exit(0);
                                //echo !empty($category) ? esc(current($category)->name) : 'Sin categoría';
                                $category = null;
                                foreach ($categories as $cat) {
                                    if ($cat->id == $ticket['category_id']) {
                                        $category = $cat;
                                        break;
                                    }
                                }
                                echo $category ? esc($category->name) : 'Sin categoría';
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
        const table = new DataTable("#ticketsTable",{
            order:[[5,"desc"]],
            processing:true,
            serverSide:false,
            searching:true,
            ordering:true,
            fixedColumns:true,
            fixedHeader:true,
            pageLength:25,
            lengthMenu:[10,25,50,100],
            responsive:false,
            language:{url:"' . site_url('assets/lang/datatables/' . $template->language . '.json') . '"},
            initComplete:()=>{table.buttons().container().appendTo("#table-data_wrapper .col-md-6:eq(0)")},
            drawCallback:()=>{$("[data-bs-toggle=\"tooltip\"]").tooltip({trigger:"hover",container:"body"})}
        });
        DataTable.Buttons.defaults.dom.button.className="btn btn-outline-primary btn-sm";

        $(".filter-btn-ajax").on("click", function(e) {
            e.preventDefault();
            const filterValue = $(this).data("filter");

            // Limpiar búsqueda previa
            table.search("").columns().search("").draw();

            if (filterValue) {
                // Filtrar por columna de estado (ajusta el índice según tu tabla)
                table.column(2).search(filterValue).draw();
            }
        });
    });
'); ?>