<?php

namespace App\Controllers\Admin;

use App\Controllers\Admin\AdminController;

class Reports extends AdminController
{
    public function index()
    {
        $this->data['page_title'] = 'Seguridad :: Reportes';

        $this->template->add_css_file('dataTables.bootstrap5,responsive.bootstrap,buttons.dataTables');
        $this->template->add_js_file('jquery.dataTables,dataTables.bootstrap5,dataTables.responsive,dataTables.buttons,buttons.print,buttons.html5,vfs_fonts,pdfmake,jszip');

        $this->data['modal'] = false;

        return $this->template->render('admin/reports/index', $this->data);
    }

    public function getReportsUsers()
    {
        // 1. Parámetros de DataTables
        $draw        = $this->request->getPost('draw');
        $start       = $this->request->getPost('start');
        $length      = $this->request->getPost('length');
        $searchValue = $this->request->getPost('search')['value'];

        // 2. Conteo total (absoluto)
        $totalRecords = $this->db->table('tickets')->countAllResults();

        // 3. Iniciar Builder para datos filtrados
        $builder = $this->db->table('tickets t');
        $builder->select('t.id as ticket_id, t.created_at, u.username, t.title, t.status, t.priority');
        $builder->join('users u', 'u.id = t.user_id', 'inner');

        // 4. Aplicar búsqueda
        if (!empty($searchValue)) {
            $builder->groupStart()
                ->like('u.username', $searchValue)
                ->orLike('t.title', $searchValue)
                ->groupEnd();
        }

        // 5. Conteo de registros filtrados (Importante: usar clone para no resetear el builder)
        $tempBuilder = clone $builder;
        $filteredRecords = $tempBuilder->countAllResults(false);

        // 6. AHORA aplicamos Orden y Paginación al builder original
        // Es vital que el get() vaya DESPUÉS del limit()
        $reports = $builder->orderBy('t.id', 'ASC')
            ->limit($length, $start) // Aquí es donde se controla que salgan 25
            ->get()
            ->getResult();

        // 7. Formatear datos
        $data = [];
        foreach ($reports as $report) {
            $data[] = [
                'id'         => $report->ticket_id,
                'created_at' => date('d/m/Y H:i', strtotime($report->created_at)),
                'username'   => $report->username,
                'title'      => $report->title,
                'priority'   => strtoupper($report->priority),
                'status'     => strtoupper($report->status),
            ];
        }

        // 8. Respuesta JSON
        return $this->response->setJSON([
            'draw'            => intval($draw),
            'recordsTotal'    => $totalRecords,
            'recordsFiltered' => $filteredRecords,
            'data'            => $data,
        ]);
    }

    public function getReportsTechnicians()
    {
        // 1. Recoger parámetros de DataTables
        $draw   = intval($this->request->getPost('draw'));
        $start  = intval($this->request->getPost('start'));
        $length = intval($this->request->getPost('length'));
        $search = $this->request->getPost('search')['value'];

        if ($length <= 0) $length = 25;

        // 2. Conteo total (absoluto en la tabla audit_log)
        $totalRecords = $this->db->table('audit_log')->countAllResults();

        // 3. Iniciar Builder para los datos
        $builder = $this->db->table('audit_log a');
        $builder->select('a.id, a.changed_at, u.username as technical, a.action, a.table_name, a.ip_address');
        $builder->join('users u', 'u.id = a.changed_by', 'left');

        // 4. Aplicar búsqueda (opcional: por técnico, acción o tabla)
        if (!empty($search)) {
            $builder->groupStart()
                ->like('u.username', $search)
                ->orLike('a.action', $search)
                ->orLike('a.table_name', $search)
                ->groupEnd();
        }

        // 5. Conteo de registros filtrados
        $tempBuilder = clone $builder;
        $filteredRecords = $tempBuilder->countAllResults(false);

        // 6. Orden y Paginación real
        $results = $builder->orderBy('a.changed_at', 'DESC') // Generalmente auditoría va de más reciente a antiguo
            ->limit($length, $start)
            ->get()
            ->getResult();

        // 7. Formatear datos
        $data = [];
        foreach ($results as $row) {
            $data[] = [
                'id'         => $row->id,
                'changed_at' => date('d/m/Y H:i:s', strtotime($row->changed_at)),
                'technical'  => $row->technical ?? 'Sistema', // Por si hay logs automáticos
                'action'     => strtoupper($row->action),
                'table_name' => $row->table_name,
                'ip_address' => $row->ip_address,
            ];
        }

        // 8. Respuesta JSON
        return $this->response->setJSON([
            'draw'            => $draw,
            'recordsTotal'    => $totalRecords,
            'recordsFiltered' => $filteredRecords,
            'data'            => $data,
        ]);
    }
}
