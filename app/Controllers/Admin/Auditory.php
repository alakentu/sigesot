<?php

namespace App\Controllers\Admin;

use App\Controllers\Admin\AdminController;

class Auditory extends AdminController
{
	public function index()
	{
		if (! $this->auth->loggedIn() || ! $this->auth->isAdmin()) {
			return redirect()->to(site_url());
		}

		$this->data['page_title'] = 'Auditoría';

		$this->template->add_css_file('dataTables.bootstrap5,responsive.bootstrap,buttons.dataTables');
		$this->template->add_js_file('jquery.dataTables,dataTables.bootstrap5,dataTables.responsive,dataTables.buttons,buttons.print,buttons.html5,vfs_fonts,pdfmake,jszip');
		//$this->template->add_file('datatables');

		$filters = [
			'table_name' => $this->request->getGet('table_name') ?? null,
			'action' => $this->request->getGet('action') ?? null,
			'date_from' => $this->request->getGet('date_from') ?? null,
			'date_to' => $this->request->getGet('date_to') ?? null
		];

		$this->data['logs'] = $this->audit->getLogs($filters)['logs'];
		$this->data['pager'] = $this->audit->pager;

		// Modal
		$this->data['modal'] = true;
		$this->data['modal_title'] = 'Comparación de Datos | Detalles de Auditoría';
		$this->data['modal_subheading'] = '';
		$this->data['modal_body'] = '';
		$this->data['modal_button'] = '';

		return $this->template->render('admin/auditory/index', $this->data);
	}

	/**
	 * Procesa solicitudes AJAX de DataTables (server-side processing)
	 *
	 * @return \CodeIgniter\HTTP\Response JSON con datos para DataTables
	 */
	public function datatable()
	{
		// Parámetros de DataTables
		$draw = $this->request->getPost('draw');
		$start = $this->request->getPost('start') ?? 0;
		$length = $this->request->getPost('length') ?? 10;
		$searchValue = $this->request->getPost('search')['value'] ?? null;

		// Filtros adicionales
		$filters = [
			'table_name' => $this->request->getPost('table_name') ?? null,
			'action' => $this->request->getPost('action') ?? null,
			'date_from' => $this->request->getPost('date_from') ?? null,
			'date_to' => $this->request->getPost('date_to') ?? null
		];

		// Obtener datos del modelo
		$result = $this->audit->getDatatableData($start, $length, $searchValue, $filters);

		return $this->response->setJSON([
			"draw" => $draw,
			"recordsTotal" => $result['totalRecords'],
			"recordsFiltered" => $result['filteredRecords'],
			"data" => $result['data']
		]);
	}

	/**
	 * Muestra detalles de un registro de auditoría en modal
	 *
	 * @param int $id ID del registro de auditoría
	 * @return string Vista parcial con detalles
	 */
	public function detail($id)
	{
		$log = $this->audit->getLogDetails($id);

		//if (!$log) {
		//	return $this->failNotFound('Registro no encontrado');
		//}

		$html = '<div class="container">';
		$html .= '<div class="row g-3">';

		// Tabla Comparativa
		$html .= '<div class="col-12">';
		$html .= '<div class="table-responsive border rounded" style="max-height: 400px; overflow: auto;">';
		$html .= '<table class="table table-sm table-bordered table-striped mb-0">';
		$html .= '<thead class="table-primary sticky-top">';
		$html .= '<tr><th colspan="3" class="text-center">COMPARACIÓN DE DATOS</th></tr>';
		$html .= '<tr><th>Campo</th><th>Valores Anteriores</th><th>Valores Nuevos</th></tr>';
		$html .= '</thead>';
		$html .= '<tbody>';

		$oldData = json_decode($log['old_data'] ?? '{}', true);
		$newData = json_decode($log['new_data'] ?? '{}', true);

		// Combinamos todas las claves únicas de ambos conjuntos
		$allKeys = array_unique(array_merge(array_keys($oldData), array_keys($newData)));

		foreach ($allKeys as $key) {
			$oldValue = $oldData[$key] ?? null;
			$newValue = $newData[$key] ?? null;

			// Función para determinar si un valor debe mostrarse
			$shouldSkipValue = function ($value) {
				return is_null($value) || $value === '';
			};

			// Saltamos los campos NULL o vacíos en ambos conjuntos
			if ($shouldSkipValue($oldValue) && $shouldSkipValue($newValue)) {
				continue;
			}

			// Formateamos los valores
			$formatValue = function ($value) {
				if (is_null($value)) {
					return 'NULL';
				}
				if ($value === '') {
					return '""'; // Esto no debería aparecer gracias a shouldSkipValue
				}
				if (is_bool($value)) {
					return $value ? 'true' : 'false';
				}
				if (is_array($value)) {
					return json_encode($value);
				}
				return $value;
			};

			$formattedOld = $formatValue($oldValue);
			$formattedNew = $formatValue($newValue);

			// Solo mostramos filas donde hay cambios o donde existe un valor no nulo/no vacío
			if ($formattedOld !== $formattedNew || (!$shouldSkipValue($oldValue) || !$shouldSkipValue($newValue))) {
				$html .= '<tr>';
				$html .= '<td class="fw-bold">' . htmlspecialchars($key) . '</td>';

				// Celda de valor antiguo
				if ($formattedOld === $formattedNew) {
					$html .= '<td style="word-break: break-all;"><strong>' . htmlspecialchars($formattedOld) . '</strong></td>';
					$html .= '<td style="word-break: break-all;"><strong>' . htmlspecialchars($formattedNew) . '</strong></td>';
				} else {
					$html .= '<td style="word-break: break-all; background-color: #ffdddd;"><strong>' .
						(!$shouldSkipValue($oldValue) ? htmlspecialchars($formattedOld) : 'NULL') . '</strong></td>';
					$html .= '<td style="word-break: break-all; background-color: #ddffdd;"><strong>' .
						(!$shouldSkipValue($newValue) ? htmlspecialchars($formattedNew) : 'NULL') . '</strong></td>';
				}

				$html .= '</tr>';
			}
		}

		$html .= '</tbody>';
		$html .= '</table>';
		$html .= '</div>'; // cierra table-responsive
		$html .= '</div>'; // cierra col-12

		$html .= '</div>'; // cierra row
		$html .= '</div>'; // cierra container

		return $html;
	}
}
