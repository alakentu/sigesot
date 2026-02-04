<?php

/**
 * @var \App\Libraries\Template $template
 * @var \App\Models\Settings $settings
 */
?>
<div class="col-12">
    <?php if (isset($message)) : ?>
        <div id="infoMessage"><?php echo $message; ?></div>
    <?php endif; ?>

    <div class="card">
        <div class="card-header d-flex align-items-center">
            <h4 class="card-title mb-0 flex-grow-1">Listado de Acciones de Usuarios</h4>
        </div>

        <div class="card-body">
            <table id="usersReports" class="table table-bordered dt-responsive nowrap table-striped align-middle" style="width:100%">
                <thead class="table-light">
                    <tr>
                        <th scope="col">ID Ticket</th>
                        <th scope="col">Fecha de Apertura</th>
                        <th scope="col">Usuario</th>
                        <th scope="col">Título de la Incidencia</th>
                        <th scope="col">Estatus</th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
    </div>

    <div class="card">
        <div class="card-header d-flex align-items-center">
            <h4 class="card-title mb-0 flex-grow-1">Listado de Acciones de Técnicos</h4>
        </div>

        <div class="card-body">
            <table id="techReports" class="table table-bordered dt-responsive nowrap table-striped align-middle" style="width:100%">
                <thead class="table-light">
                    <tr>
                        <th scope="col">ID Auditoría</th>
                        <th scope="col">Fecha/Hora</th>
                        <th scope="col">Técnico Responsable</th>
                        <th scope="col">Acción Realizada</th>
                        <th scope="col">Registro Afectado</th>
                        <th scope="col">Detalles de la Operación</th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
    </div>
</div>
<?php
$template->add_inline('
// Recargar DataTables después de mostrar la alerta
$(document).ready(function() {
    <?php if (isset($_GET["alert"])): ?>
        // Asumiendo que tu DataTables tiene ID "usersTable"
        if (typeof usersTable !== "undefined") {
            usersTable.ajax.reload(null, false);
        }
    <?php endif; ?>
});
');
$template->add_inline('
$(function(){
    let u=new DataTable("#usersReports",{
        order:[[0,"asc"]],    
        columnDefs:[
            {targets:"_all",searchable:true}
        ],
        processing:true,
        serverSide:true,
        searching:true,
        ordering:false,
        fixedColumns:true,
        fixedHeader:true,
        pageLength:25,
        lengthMenu:[10,25,50,100],
        paginate: true,
		filter: true,
		responsive: true,
		autoWidth: false,
		lengthChange: true,
        ajax:{
            url:"' . base_url('admin/reports/usersreports') . '",
            headers:{"X-Requested-With":"XMLHttpRequest"},
            type:"POST"
        },
        columns: [
            { data: "id" },
            { data: "created_at" },
            { data: "username" },
            { data: "title" },
            { data: "status" }
        ],
        buttons: [
            {
                extend: "excelHtml5",
                title: "Acciones de Usuarios - SIGESOT"
            },
            {
                extend: "pdfHtml5",
                title: "Acciones de Usuarios - SIGESOT",
                orientation: "landscape",
                pageSize: "LEGAL"
            },
            {
                extend: "print",
                title: "Acciones de Usuarios - SIGESOT"
            }
        ],
        layout: {
            topStart: { pageLength: { menu: 25 } },
            top2Start: "buttons",
            topEnd: { search: { placeholder: "Buscar..." } }
        },
        language:{url:"' . site_url('assets/lang/datatables/' . $template->language . '.json') . '"},
        initComplete:()=>{u.buttons().container().appendTo("#usersReports_wrapper .col-md-6:eq(0)")}
    });

    let t=new DataTable("#techReports",{
        order:[[0,"asc"]],
        columnDefs:[
            {targets:"_all",visible:true,searchable:true}
        ],
        processing:true,
        serverSide:true,
        searching:false,
        ordering:false,
        fixedColumns:true,
        fixedHeader:true,
        pageLength:25,
        lengthMenu:[10,25,50,100],
        responsive:false,
        ajax:{
            url:"' . base_url('admin/reports/techreports') . '",
            headers:{"X-Requested-With":"XMLHttpRequest"},
            type:"POST"
        },
        columns: [
            { data: "id" },
            { data: "changed_at" },
            { data: "technical" },
            { data: "action" },
            { data: "table_name" },
            { data: "ip_address" }
        ],
        language:{url:"' . site_url('assets/lang/datatables/' . $template->language . '.json') . '"},
        initComplete:()=>{t.buttons().container().appendTo("#techReports_wrapper .col-md-6:eq(0)")}
    });

    DataTable.Buttons.defaults.dom.button.className="btn btn-outline-primary btn-sm";
});
');
?>