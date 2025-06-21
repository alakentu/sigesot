<?php

/**
 * @var \App\Libraries\Template $template
 * @var \App\Models\Settings $settings
 */
?>
<div class="col-xl-12">
    <?php if (isset($message)) : ?>
        <div id="infoMessage"><?php echo $message; ?></div>
    <?php endif; ?>

    <div class="card">
        <div class="card-header align-items-center d-flex">
            <h4 class="card-title mb-0 flex-grow-1">Listado de Usuarios del Sistema</h4>

            <div class="flex-shrink-0">
                <div class="form-check form-switch form-switch-right form-switch-md">
                    <button type="button" class="btn btn-primary" id="addUser" data-bs-toggle="modal" data-bs-target="#adminModal">Agregar Usuario</button>
                </div>
            </div>
        </div>

        <div class="card-body">
            <div class="live-preview">
                <div class="table-responsive table-card">
                    <table class="table align-middle table-nowrap table-striped-columns mb-0" id="usersTable" style="width:100%">
                        <thead class="table-light">
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Nombres y Apellidos</th>
                                <th scope="col">Teléfono</th>
                                <th scope="col">Nombre de Usuario</th>
                                <th scope="col">Foto</th>
                                <th scope="col">Género</th>
                                <th scope="col">Nacionalidad</th>
                                <th scope="col">Organización</th>
                                <th scope="col">Estatus</th>
                                <th scope="col">Acción</th>
                                <th scope="col">Correo</th>
                                <th scope="col">Fecha de Registro</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
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
    let t=new DataTable("#usersTable",{
        order:[[1,"asc"]],
        columnDefs:[
            {targets:[0],orderable:!1,visible:!1},
            {targets:[1],orderable:!0},
            {targets:[2,3,4,5,6,7,8,9,10,11],orderable:!1}
        ],
        processing:!0,
        serverSide:!0,
        ordering:!0,
        fixedColumns:!0,
        stateSave:!0,
        pageLength:25,
        lengthMenu:[10,25,50,100],
        responsive:{
            details:{
                display:DataTable.Responsive.display.modal({
                    header:r=>"Detalles para: "+r.data().names
                }),
                renderer:(a,r,c)=>{
                    let d=$.map(c,(e,i)=>e.hidden?
                        `<tbody><tr data-dt-row="${e.rowIndex}" data-dt-column="${e.columnIndex}">
                            <td class="fw-bolder td-blocks">${e.title}:</td>
                            <td class="td-response">${e.data}</td>
                        </tr></tbody>`:""
                    ).join("");
                    return d?$("<table/>").append(d).addClass("table table-hover table-bordered table-sm"):!1
                }
            }
        },
        ajax:{
            url:"' . base_url('admin/users/usersdata') . '",
            headers:{"X-Requested-With":"XMLHttpRequest"},
            type:"POST"
        },
        columns:[
            {data:"id"},
            {data:"names"},
            {data:"phone"},
            {data:"username"},
            {data:"photo",render(d,t,r){
                if("display"===t){
                    let p=site+r.photo,n=r.names;
                    return`<img src="${p}" class="img-thumbnail" alt="${n}">`
                }
                return d
            }},
            {data:"gender",render(d,t,r){
                if("display"===t){
                    switch(d){
                        case"1":return"Masculino";
                        case"2":return"Femenino"
                    }
                }
                return d
            }},
            {data:"nationality",render(d,t,r){
                if("display"===t){
                    switch(d){
                        case"1":return"Venezolano";
                        case"2":return"Extranjero"
                    }
                }
                return d
            }},
            {data:"company"},
            {data:"active",className:"text-center",render(d,t,r){
                if("display"===t){
                    let a=r.active,
                        t=0==a?"' . lang('Site.GlobalInactive') . '":"' . lang('Site.GlobalActive') . '",
                        i=0==a?\'<i class="bi bi-x-lg text-danger"></i>\':\'<i class="bi bi-check2 text-success"></i>\';
                    return`<a href="javascript:void(0)" class="text-inherit" data-bs-toggle="tooltip" data-bs-title="${t}">${i}</a>`
                }
                return d
            }},
            {data:null,render(d,t,r){
                if("display"===t){
                    let a=r.active,
                        u="' . base_url('admin/users/changestatus') . '",
                        t=0==a?"' . lang('Site.GlobalActivate') . '":"' . lang('Site.GlobalDeactivate') . '",
                        i=0==a?\'<i class="bi bi-check2"></i>\':\'<i class="bi bi-x-lg"></i>\',
                        b=1==a?"btn-outline-danger":"btn-outline-success",
                        e=`<a href="' . base_url('admin/users/edit_user/') . '${r.id}" class="btn btn-outline-primary btn-sm rounded" data-bs-toggle="tooltip" data-bs-title="' . lang('Site.GlobalEdit') . '"><i class="bi bi-pencil"></i></a>`,
                        up=`<button type="button" class="btn ${b} btn-sm rounded" id="change_status" data-ajax="${u}" data-id="${r.id}" data-status="${a}" data-bs-toggle="tooltip" data-bs-title="${t}">${i}</button>`;
                    return e+" "+up
                }
                return d
            }},
            {data:"email"},
            {data:"created_at"}
        ],
        language:{url:"' . site_url('assets/lang/datatables/' . $template->language . '.json') . '"},
        initComplete:()=>{t.buttons().container().appendTo("#table-data_wrapper .col-md-6:eq(0)")},
        drawCallback:()=>{$("[data-bs-toggle=\"tooltip\"]").tooltip({trigger:"hover",container:"body"})}
    });
    DataTable.Buttons.defaults.dom.button.className="btn btn-outline-primary btn-sm";
});
');
?>