<?php

namespace App\Models;

use CodeIgniter\Model;

class Settings extends Model
{
	protected $DBGroup              = 'default';
	protected $table                = 'siteconfig';
	protected $primaryKey           = 'id';
	protected $useAutoIncrement     = true;
	protected $insertID             = 0;
	protected $returnType           = 'array';
	protected $useSoftDelete        = true;
	protected $protectFields        = true;
	protected $allowedFields        = [
		"name",
		"description",
		"address",
		"state",
		"country",
		"postcode",
		"telephone",
		"rif",
		"logo",
		"author",
		"list_limit",
		"mailfrom",
		"fromname",
		"metadesc",
		"metakey",
		"offline",
		"offline_message",
		"created_at",
		"created_user_id",
		"updated_at",
		"updated_user_id",
		"deleted_at",
		"version",
	];

	// Dates
	protected $useTimestamps        = true;
	protected $dateFormat           = 'datetime';
	protected $createdField         = 'created_at';
	protected $updatedField         = 'updated_at';
	protected $deletedField         = 'deleted_at';

	// Validation
	protected $validationRules      = [];
	protected $validationMessages   = [];
	protected $skipValidation       = false;
	protected $cleanValidationRules = true;

	// Callbacks
	protected $allowCallbacks       = true;
	protected $beforeInsert         = [];
	protected $afterInsert          = [];
	protected $beforeUpdate         = [];
	protected $afterUpdate          = [];
	protected $beforeFind           = [];
	protected $afterFind            = [];
	protected $beforeDelete         = [];
	protected $afterDelete          = [];

	public function getConfig()
	{
		return $this->db->table($this->table)->get()->getRow();
	}

	public function insertConfig($data)
	{
		return $this->db->table($this->table)->insert($data);
	}

	public function updateConfig(int $id, array $data)
	{
		return $this->db->table($this->table)->update($data, ['id' => $id]);
	}
}
