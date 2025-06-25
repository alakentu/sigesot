<?php

namespace App\Services;

use CodeIgniter\Config\BaseService;

class AuditsService extends BaseService
{
    protected $db;
    protected $request;

    public function __construct()
    {
        $this->db = \Config\Database::connect();
        $this->request = \Config\Services::request();
    }

    public function logActivity($title, $description)
    {
        $data = [
            'ip_address' => $this->request->getIPAddress(),
            'title' => $title,
            'description' => $description
        ];

        $this->db->table('logs_activity')->insert($data);
    }

    public function logAudit($tableName, $recordId, $action, $oldData = null, $newData = null)
    {
        $user = session()->get('user_id') ?? null;

        $data = [
            'table_name' => $tableName,
            'record_id' => $recordId,
            'action' => $action,
            'old_data' => $oldData ? json_encode($oldData) : null,
            'new_data' => $newData ? json_encode($newData) : null,
            'changed_by' => $user,
            'ip_address' => $this->request->getIPAddress()
        ];

        $this->db->table('audit_log')->insert($data);
    }
}
