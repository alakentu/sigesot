<?php

namespace App\Models;

use App\Libraries\IonAuth;
use CodeIgniter\Model;
use App\Models\Ticket;
use App\Models\IonAuthModel;

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
    protected $createdField  = 'created_on';
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

    /**
     * Obtiene usuarios por grupo/rol
     */
    public function getUsersByGroup(string $groupName, bool $onlyActive = true)
    {
        $builder = $this->db->table($this->table . ' u')
            ->select('u.*')
            ->join('users_groups ug', 'ug.user_id = ' . 'u.id')
            ->join('groups g', 'g.id = ug.group_id')
            ->where('g.name', $groupName);

        if ($onlyActive) {
            $builder->where('u.active', 1);
        }

        $query = $builder->get();

        // Verificar si la consulta fue exitosa
        if ($query === false) {
            log_message('error', 'Error en getUsersByGroup: ' . $this->db->error()['message']);
            return [];
        }

        return $query->getResultArray();
    }

    /**
     * Obtiene técnicos disponibles para asignar tickets
     */
    public function getTechnicians()
    {
        // Primero obtenemos todos los técnicos
        $technicians = $this->getUsersByGroup('technical');

        return $technicians;
    }

    /**
     * Obtiene técnicos disponibles filtrados por categoría de ticket
     */
    public function getTechniciansByCategory(int $categoryId)
    {
        // Primero obtenemos todos los técnicos
        $technicians = $this->getUsersByGroup('technical');

        return $technicians;
    }

    /**
     * Obtiene técnicos con su carga actual de tickets
     */
    public function getTechniciansWithWorkload()
    {
        $technicians = $this->getTechnicians();
        $ticketModel = new Ticket();

        foreach ($technicians as &$tech) {
            $tech['open_tickets'] = $ticketModel->where('assigned_to', $tech['id'])
                ->where('status !=', 'cerrado')
                ->countAllResults();
        }

        return $technicians;
    }

    /**
     * Obtiene información completa de un usuario con sus grupos
     */
    public function getUserWithGroups(int $userId)
    {
        $user = $this->find($userId);
        if (!$user) {
            return null;
        }

        // Obtener grupos usando IonAuth
        $auth = new IonAuthModel();
        $user['groups'] = $auth->getUsersGroups($userId);

        return $user;
    }

    /**
     * Obtiene el nombre completo del usuario
     */
    public function getFullName(int $userId): string
    {
        $user = $this->select('first_name, first_last_name, second_last_name')->find($userId);

        if (!$user) {
            return 'Usuario desconocido';
        }

        $name = trim($user['first_name'] . ' ' . $user['first_last_name']);
        if (!empty($user['second_last_name'])) {
            $name .= ' ' . $user['second_last_name'];
        }

        return $name;
    }

    /**
     * Obtiene usuarios para dropdowns
     */
    public function getForDropdown()
    {
        $users = $this->select('id, first_name, first_last_name, email')
            ->where('active', 1)
            ->orderBy('first_name', 'ASC')
            ->findAll();

        $result = [];
        foreach ($users as $user) {
            $result[$user['id']] = "{$user['first_name']} {$user['first_last_name']} ({$user['email']})";
        }

        return $result;
    }

    /**
     * Busca usuarios por término (nombre, email, teléfono)
     */
    public function search(string $term)
    {
        return $this->like('first_name', $term)
            ->orLike('first_last_name', $term)
            ->orLike('email', $term)
            ->orLike('phone', $term)
            ->where('active', 1)
            ->findAll();
    }

    /**
     * Verifica si un usuario tiene un rol específico
     */
    public function hasRole(int $userId, string $role): bool
    {
        $auth = new IonAuthModel();
        $groups = $auth->getUsersGroups($userId)->getResult();
        return in_array($role, $groups);
    }

    /**
     * Obtiene los IDs de los grupos de un usuario
     */
    public function getUserGroupIds(int $userId): array
    {
        $auth = new IonAuthModel();
        return $auth->getUsersGroups($userId, true)->getResult(); // Devuelve IDs
    }

    /**
     * Obtiene usuarios con sus roles (para administración)
     */
    public function getUsersWithRoles()
    {
        $users = $this->where('active', 1)->findAll();

        $auth = new IonAuthModel();
        foreach ($users as &$user) {
            $user['roles'] = $auth->getUsersGroups($user['id']);
        }

        return $users;
    }

    /**
     * Obtiene los datos básicos del usuario actual
     */
    public function currentUserData(): ?array
    {
        $auth = new IonAuth;
        if (!$auth->loggedIn()) {
            return null;
        }

        return $this->select('id, first_name, first_last_name, email, photo')
            ->find($auth->getUserId());
    }

    /**
     * Busca usuarios por nombre, email o teléfono
     */
    public function searchUsers(string $term)
    {
        return $this->like('first_name', $term)
            ->orLike('first_last_name', $term)
            ->orLike('email', $term)
            ->orLike('phone', $term)
            ->where('active', 1)
            ->findAll();
    }

    public function can(string $permission): bool
    {
        $auth = new IonAuth;

        // 1. Cachear permisos para mejor performance
        $userId = $auth->getUserId();
        $cacheKey = "user_{$userId}_permissions";

        if (!$permissions = cache($cacheKey)) {
            $permissions = [];

            // 2. Obtener grupos del usuario
            $groups = $auth->getUsersGroups($userId)->getResult();

            // 3. Cargar configuración de permisos
            $permissionConfig = config('Config\\Permissions');

            foreach ($groups as $group) {
                $groupName = strtolower($group->name);
                if (isset($permissionConfig->$groupName)) {
                    $permissions = array_merge($permissions, $permissionConfig->$groupName);
                }
            }

            cache()->save($cacheKey, array_unique($permissions), 3600);
        }

        return in_array($permission, $permissions);
    }

    /**
     * Verifica si el usuario tiene al menos uno de los permisos
     */
    public function canAny(array $permissions): bool
    {
        foreach ($permissions as $permission) {
            if ($this->can($permission)) {
                return true;
            }
        }
        return false;
    }

    /**
     * Verifica si el usuario tiene todos los permisos
     */
    public function canAll(array $permissions): bool
    {
        foreach ($permissions as $permission) {
            if (!$this->can($permission)) {
                return false;
            }
        }
        return true;
    }

    protected function getGroups(int $userId): array
    {
        return $this->db->table('users_groups ug')
            ->select('g.name')
            ->join('groups g', 'g.id = ug.group_id')
            ->where('ug.user_id', $userId)
            ->get()
            ->getResultArray();
    }

    public function getSignupTrend(): float
    {
        // Obtener el mes actual y el anterior
        $currentMonth = date('m');
        $currentYear = date('Y');
        $lastMonth = date('m', strtotime('-1 month'));
        $lastYear = date('Y', strtotime('-1 month'));

        // Consulta para el mes actual (convertir integer a timestamp y extraer mes)
        $currentCount = $this->builder()
            ->where("EXTRACT(MONTH FROM to_timestamp(created_on)) = ", $currentMonth)
            ->where("EXTRACT(YEAR FROM to_timestamp(created_on)) = ", $currentYear)
            ->countAllResults();

        // Consulta para el mes anterior
        $lastMonthCount = $this->builder()
            ->where("EXTRACT(MONTH FROM to_timestamp(created_on)) = ", $lastMonth)
            ->where("EXTRACT(YEAR FROM to_timestamp(created_on)) = ", $lastYear)
            ->countAllResults();

        // Calcular tendencia
        return $lastMonthCount ? round(($currentCount - $lastMonthCount) / $lastMonthCount * 100, 2) : ($currentCount ? 100 : 0);
    }
}
