<?php

namespace App\Models;

use CodeIgniter\Model;

class TicketCategory extends Model
{
    protected $table            = 'ticket_categories';
    protected $primaryKey       = 'id';
    protected $useAutoIncrement = true;
    protected $returnType       = 'array';
    protected $useSoftDeletes   = false;
    protected $protectFields    = true;
    protected $allowedFields    = [
        'name',
        'description',
        'created_by',
        'is_active',
        'parent_id',
        'default_priority'
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
    protected $validationRules = [
        'name' => 'required|min_length[3]|max_length[50]|is_unique[ticket_categories.name,id,{id}]',
        'description' => 'permit_empty|max_length[255]',
        'is_active' => 'permit_empty|numeric'
    ];
    protected $validationMessages = [
        'name' => [
            'required' => 'El nombre de la categoría es obligatorio',
            'min_length' => 'El nombre debe tener al menos 3 caracteres',
            'max_length' => 'El nombre no puede exceder los 50 caracteres',
            'is_unique' => 'Esta categoría ya existe'
        ],
        'description' => [
            'max_length' => 'La descripción no puede exceder los 255 caracteres'
        ]
    ];
    protected $skipValidation       = false;
    protected $cleanValidationRules = true;

    // Callbacks
    protected $allowCallbacks = true;
    protected $beforeInsert = ['setCreatedBy'];
    protected $afterInsert    = [];
    protected $beforeUpdate   = [];
    protected $afterUpdate    = [];
    protected $beforeFind     = [];
    protected $afterFind      = [];
    protected $beforeDelete   = [];
    protected $afterDelete    = [];

    /**
     * Establece el usuario creador antes de insertar
     */
    protected function setCreatedBy(array $data)
    {
        if (service('auth')->loggedIn()) {
            $data['data']['created_by'] = service('auth')->id();
        }
        return $data;
    }

    /**
     * Obtiene categorías activas para dropdowns
     */
    public function getActiveCategories()
    {
        return $this->where('is_active', 1)->orderBy('name', 'ASC')->findAll();
    }

    /**
     * Obtiene categorías con conteo de tickets
     */
    public function getCategoriesWithTicketCount()
    {
        $builder = $this->db->table($this->table);
        $builder->select('ticket_categories.*, COUNT(tickets.id) as ticket_count');
        $builder->join('tickets', 'tickets.category_id = ticket_categories.id', 'left');
        $builder->where('ticket_categories.is_active', 1);
        $builder->groupBy('ticket_categories.id');
        $builder->orderBy('ticket_categories.name', 'ASC');

        return $builder->get()->getResultArray();
    }

    /**
     * Marca categoría como inactiva (borrado lógico)
     */
    public function deactivateCategory($id)
    {
        return $this->update($id, ['is_active' => 0]);
    }
}
