<?php

namespace App\Models;

use CodeIgniter\Model;

class Ticket extends Model
{
    protected $table            = 'tickets';
    protected $primaryKey       = 'id';
    protected $useAutoIncrement = true;
    protected $returnType       = 'array';
    protected $useSoftDeletes   = false;
    protected $protectFields    = true;
    protected $allowedFields    = ['title', 'description', 'status', 'user_id', 'assigned_to'];

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

    // Cache por 5 minutos (300 segundos)
    protected $cacheTTL = 300;

    public function getActiveTickets($userId = null)
    {
        $cache = \Config\Services::cache();
        $cacheKey = 'active_tickets_' . ($userId ?? 'all');

        if (!$tickets = $cache->get($cacheKey)) {
            $builder = $this->builder();
            $builder->where('status !=', 'closed');

            if ($userId) {
                $builder->where('user_id', $userId);
            }

            $tickets = $builder->orderBy('created_at', 'DESC')->get()->getResultArray();

            // Guardar en cache
            $cache->save($cacheKey, $tickets, $this->cacheTTL);
        }

        return $tickets;
    }

    public function clearTicketCache($userId = null)
    {
        $cache = \Config\Services::cache();
        $cache->delete('active_tickets_' . ($userId ?? 'all'));
    }
}
