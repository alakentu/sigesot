<?php

namespace App\Models;

use CodeIgniter\Model;

class Notification extends Model
{
    protected $table            = 'notifications';
    protected $primaryKey       = 'id';
    protected $useAutoIncrement = true;
    protected $returnType       = 'array';
    protected $useSoftDeletes   = false;
    protected $protectFields    = true;
    protected $allowedFields    = [
        'user_id',
        'type',
        'related_id',
        'title',
        'message',
        'is_read',
        'read_at',
        'created_at'
    ];

    protected bool $allowEmptyInserts = false;
    protected bool $updateOnlyChanged = true;

    protected array $casts = [];
    protected array $castHandlers = [];

    // Dates
    protected $useTimestamps = true;
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

    /**
     * Marca como leídas las notificaciones que coinciden con los IDs proporcionados.
     *
     * @param array $ids Los IDs de las notificaciones a marcar como leídas.
     *
     * @return int El número de filas actualizadas.
     */
    public function markAsRead(array $ids)
    {
        if (empty($ids)) return 0;

        return $this->whereIn('id', $ids)
            ->where('is_read', 0)
            ->set([
                'is_read' => 1,
                'read_at' => date('Y-m-d H:i:s')
            ])
            ->update();
    }

    /**
     * Obtiene las notificaciones recientes de un usuario
     */
    public function getUserNotifications(int $userId, int $limit = 10)
    {
        return $this->where('user_id', $userId)
            ->orderBy('created_at', 'DESC')
            ->limit($limit)
            ->findAll();
    }

    public function getUnreadNotifications(int $userId)
    {
        $builder = $this->db->table('notifications n');
        $dbNotifications = $builder
            ->select('n.*, t.priority, t.title as ticket_title')
            ->join('tickets t', 't.id = n.related_id AND n.type IN(\'new_ticket\', \'ticket_update\', \'ticket_closed\')', 'left')
            ->where('n.user_id', $userId)
            ->where('n.is_read', 0)
            ->orderBy('n.created_at', 'DESC')
            ->get()
            ->getResultArray();

        return $dbNotifications;
    }

    /**
     * Cuenta las notificaciones no leídas
     */
    public function countUnread(int $userId): int
    {
        return $this->where('user_id', $userId)
            ->where('is_read', 0)
            ->countAllResults();
    }
}
