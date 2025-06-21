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
		<div class="card-header">
			<h4 class="card-title">Registros de Auditoría</h4>
			<p class="card-title-desc">Aqui pueden ver los registros de actividades del sistem para la auditoría.</p>
		</div>

		<div class="card-body">
			<div class="live-preview">
				<div class="table-responsive">
					<table class="table align-middle table-nowrap table-striped-columns mb-0" id="auditTable" style="width:100%">
						<thead class="table-light">
							<tr>
								<th scope="col">ID</th>
								<th scope="col">Tabla</th>
								<th scope="col">Acción</th>
								<th scope="col">Registro ID</th>
								<th scope="col">Usuario</th>
								<th scope="col">IP</th>
								<th scope="col">Fecha</th>
								<th scope="col">Acciones</th>
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
if (isset($_GET["alert"])):
	$template->add_inline('
	// Recargar DataTables después de mostrar la alerta
	$(document).ready(function() {
		// Asumiendo que tu DataTables tiene ID "auditTable"
		if (typeof auditTable !== "undefined") {
				auditTable.ajax.reload(null, false);
		}
	});
	');
endif;

$template->add_inline('
$(document).ready(function() {
	let t=new DataTable("#auditTable",{
		order:[[1,"asc"]],
		ordering:true,
		columnDefs:[
			{targets:[0],visible:true,orderable:true},
			{targets:[1,2,3,4,5,6,7],visible:true,orderable:false}
		],
		processing: true,
		serverSide: true,
		lengthChange: false,
		fixedColumns: true,
		stateSave: true,
		pageLength: 25,
		lengthMenu:[10,25,50,100],
		response: true,
		ajax: {
			url:"' . base_url('admin/auditory/datatable') . '",
			headers:{"X-Requested-With":"XMLHttpRequest"},
			type: "POST"
    	},
		layout: {
			topStart: {
				buttons: [
					{
						extend: "excelHtml5",
						title: "' . str_replace(' ', '_', $page_title) . '",
						text: "<i class=\"bi bi-file-earmark-excel\"></i> Excel",
						className: "btn btn-success text-white",
						exportOptions: {
							columns: [0, 1, 2, 3, 4, 5, 6]
						}
					},
					{
						extend: "pdfHtml5",
						title: "' . str_replace(' ', '_', $page_title) . '",
						text: "<i class=\"bi bi-file-earmark-pdf\"></i> PDF",
						className: "btn btn-danger ml-2 text-white",
						exportOptions: {
							columns: [0, 1, 2, 3, 4, 5, 6]
						}
					},
					{
						extend: "print",
						title: "' . str_replace(' ', '_', $page_title) . '",
						text: "<i class=\"bi bi-printer\"></i> Imprimir",
						className: "btn btn-dark ml-2 text-white",
						exportOptions: {
							columns: [0, 1, 2, 3, 4, 5, 6]
						},
						customize: function (win) {
							$(win.document.body).find("h1").css("margin","20px 20px 10px");
							$(win.document.body).find("table").css("margin","20px 15px 0");
						}
					}
				],
			}
		},
    	columns: [
			{ data: "id" },
			{ data: "table_name" },
			{ data: "action", render(d,t,r){
				if("display"===t){
					let a = r.action, c = "info"; let x = "";

					switch (a) {
						case "INSERT":
							c = "success";
							a = "INSERTAR";
							break;
						case "DELETE":
							c = "danger";
							a = "ELIMINAR";
							break;
						case "LOGOUT":
							c = "warning";
							a = "DESCONETAR";
							break;
						case "LOGIN":
							c = "primary";
							a = "CONECTAR";
							break;
						case "UPDATE":
							c = "info";
							a = "ACTUALIZAR";
							break;
					}

					return`<span class="badge text-bg-${c}">${a}</span>`
				}

				return d;
			},
				className:"text-center"},
			{ data: "record_id" },
			{ data: "changed_by",
				render: function(data) {
					return data ? data : "Sistema";
				}
			},
			{ data: "ip_address" },
			{ data: "changed_at",
				render: function(data) {
					return new Date(data).toLocaleString();
				}
			},
			{ data: null,
				render: function(data) {
					return "<button class=\"btn btn-sm btn-info view-detail\" data-id=\"" + data.id + "\">" + "<i class=\"bi bi-eye\"></i> Detalles</button>";
				},
				orderable: false
			}
    	],
    language:{url:"' . site_url('assets/lang/datatables/' . $template->language . '.json') . '"},
    initComplete:()=>{t.buttons().container().appendTo("#table-data_wrapper .col-md-6:eq(0)")},
    drawCallback:()=>{$("[data-bs-toggle=\"tooltip\"]").tooltip({trigger:"hover",container:"body"})}
	});

	DataTable.Buttons.defaults.dom.button.className="btn btn-outline-primary btn-sm";

  /**
   * Evento para mostrar detalles en modal
   */
  $("#auditTable").on("click", ".view-detail", function() {
      var auditId = $(this).data("id");
      $.ajax({
		url: "' . base_url('admin/auditory/detail/') . '" + auditId,
		type: "POST",
		headers: { "X-Requested-With": "XMLHttpRequest", "Accept": "application/json" },
		data: { id: auditId },
		success: function(response) {
			var modalElement = document.getElementById("auditModal");
            var modal = bootstrap.Modal.getInstance(modalElement) || new bootstrap.Modal(modalElement);

			if(response){
				$("#auditModalBody").html(response);
				modal.show();
			}

			$(document).on("click", ".modal-backdrop", function () {
				modal.hide();
			});
		},
        error: function(xhr, status, error) {
            console.error("Error cargando detalles:", error);
            $("#auditModalBody").html("<div class=\"alert alert-danger\">Error al cargar los detalles</div>");
            new bootstrap.Modal(document.getElementById("auditModal")).show();
        }
	});

	$(".card").css("box-shadow", "none");
  });
});
');
?>