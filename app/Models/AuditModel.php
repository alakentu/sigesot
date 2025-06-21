<?php

namespace App\Models;

use CodeIgniter\Model;

class AuditModel extends Model
{
	protected $table            = 'audit_log';
	protected $primaryKey       = 'id';
	protected $useAutoIncrement = true;
	protected $returnType       = 'array';
	protected $useSoftDeletes   = false;
	protected $protectFields    = true;
	protected $allowedFields 	= ['table_name', 'record_id', 'action', 'old_data', 'new_data', 'changed_by', 'ip_address'];

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

	/**
	 * Obtiene registros paginados con filtros básicos
	 *
	 * @param array $filters Filtros a aplicar
	 * @param int $perPage Registros por página
	 * @return array [
	 *   'logs' => Resultados paginados,
	 *   'pager' => Objeto paginador
	 * ]
	 */
	public function getLogs(array $filters = [], int $perPage = 20)
	{
		$builder = $this->builder();

		// Aplicar filtros
		$this->applyFilters($builder, $filters);

		$builder->orderBy('id', 'ASC');

		return [
			'logs' => $this->paginate($perPage),
			'pager' => $this->pager
		];
	}

	/**
	 * Procesa datos para DataTables (server-side)
	 *
	 * @param int $start Índice de inicio
	 * @param int $length Registros por página
	 * @param string|null $searchValue Texto de búsqueda global
	 * @param array $filters Filtros adicionales
	 * @return array [
	 *   'totalRecords' => Total sin filtrar,
	 *   'filteredRecords' => Total con filtros,
	 *   'data' => Resultados paginados
	 * ]
	 */
	public function getDatatableData(int $start, int $length, ?string $searchValue, array $filters)
	{
		$builder = $this->builder();

		// Aplicar filtros base
		$this->applyFilters($builder, $filters);

		// Búsqueda global
		if (!empty($searchValue)) {
			$builder->groupStart()
				->like('table_name', $searchValue)
				->orLike('action', $searchValue)
				->orLike('record_id', $searchValue)
				->orLike('changed_by', $searchValue)
				->orLike('ip_address', $searchValue)
				->groupEnd();
		}

		// Total de registros sin filtrar
		$totalRecords = $this->countAll();

		// Total de registros filtrados
		$filteredRecords = $builder->countAllResults(false);

		// Paginación y orden
		$builder->orderBy('id', 'ASC')->limit($length, $start);

		return [
			'totalRecords' => $totalRecords,
			'filteredRecords' => $filteredRecords,
			'data' => $builder->get()->getResultArray()
		];
	}

	/**
	 * Aplica filtros comunes a los queries
	 * 
	 * @param object &$builder Query Builder
	 * @param array $filters Filtros a aplicar
	 */
	protected function applyFilters(&$builder, array $filters)
	{
		if (!empty($filters['table_name'])) {
			$builder->where('table_name', $filters['table_name']);
		}
		if (!empty($filters['action'])) {
			$builder->where('action', $filters['action']);
		}
		if (!empty($filters['date_from'])) {
			$builder->where('changed_at >=', $filters['date_from'] . ' 00:00:00');
		}
		if (!empty($filters['date_to'])) {
			$builder->where('changed_at <=', $filters['date_to'] . ' 23:59:59');
		}
	}

	public function getLogDetails(int $id)
	{
		return $this->find($id);
	}
}
