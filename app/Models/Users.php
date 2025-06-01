<?php

namespace App\Models;

use CodeIgniter\Model;

class Users extends Model
{
    protected $table            = 'users';
    protected $primaryKey       = 'id';
    protected $useAutoIncrement = true;
    protected $returnType       = 'array';
    protected $useSoftDeletes   = false;
    protected $protectFields    = true;
    protected $allowedFields    = [
        'id',
        'ip_address',
        'username',
        'password',
        'email',
        'created_on',
        'active',
        'first_name',
        'middle_name',
        'first_last_name',
        'second_last_name',
        'gender',
        'nationality',
        'photo',
        'company',
        'phone',
    ];

    protected bool $allowEmptyInserts = false;
    protected bool $updateOnlyChanged = true;

    protected array $casts = [];
    protected array $castHandlers = [];

    // Dates
    protected $useTimestamps = false;
    protected $dateFormat    = 'datetime';
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';

    // Validation
    protected $validationRules      = [];
    protected $validationMessages   = [];
    protected $skipValidation       = false;
    protected $cleanValidationRules = true;

    // Callbacks
    protected $allowCallbacks = true;
    protected $beforeInsert   = [];
    protected $afterInsert    = [];
    protected $beforeUpdate   = [];
    protected $afterUpdate    = [];
    protected $beforeFind     = [];
    protected $afterFind      = [];
    protected $beforeDelete   = [];
    protected $afterDelete    = [];

    public function changeStatus($id, $status)
    {
        $user = $this->db->query('SELECT * FROM ' . $this->table . ' WHERE id = ' . $id . ' AND active = ' . $status);
        $row = $user->getRow();
        $data = [];

        if ($user && $row->id === $id) {

            $active = [
                'active' => (int) $row->active === 0 ? 1 : 0,
            ];

            $query = $this->db->table($this->table)->update($active, ['id' => $id]);

            if ($query && $this->db->affectedRows() === 1) {
                $data['code'] = 1;
                $data['redirect'] = '/admin/users';
                $data['message'] = 'Se ha cambiado el estatus del/la Usuario(a) correctamente.';
                $data['class'] = 'success';
            } else {
                $data['code'] = 0;
                $data['redirect'] = '/admin/users';
                $data['message'] = 'Error al cambiar el estatus del/la Usuario(a).';
                $data['class'] = 'danger';
            }
        }

        echo json_encode($data);
    }
}
