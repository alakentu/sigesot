<?php

namespace App\Models;

use CodeIgniter\Model;
use App\Models\TicketComment;
use App\Models\TicketHistory;

class Ticket extends Model
{
    protected $table = 'tickets';
    protected $primaryKey = 'id';
    protected $allowedFields = [
        'title',
        'description',
        'status',
        'priority',
        'user_id',
        'assigned_to',
        'category_id',
        'created_at',
        'updated_at',
        'closed_at',
        'closed_by'
    ];

    protected $useTimestamps = true;
    protected $createdField = 'created_at';
    protected $updatedField = 'updated_at';
    protected $beforeInsert = ['setCreatedAt'];
    protected $beforeUpdate = ['setUpdatedAt'];

    protected function setCreatedAt(array $data)
    {
        $data['data']['created_at'] = date('Y-m-d H:i:s');
        return $data;
    }

    protected function setUpdatedAt(array $data)
    {
        $data['data']['updated_at'] = date('Y-m-d H:i:s');
        return $data;
    }

    public function checkUserTicketLimit($userId)
    {
        $helpdesk = config('Config\\Helpdesk');
        $maxTickets = $helpdesk->max_tickets_per_user ?? 3;
        $today = date('Y-m-d');

        // Tickets creados hoy
        $ticketsToday = $this->where('user_id', $userId)
            ->where("DATE(created_at) = ", $today)
            ->countAllResults();

        // Tickets resueltos hoy
        $resolvedToday = $this->where('user_id', $userId)
            ->where('status', 'cerrado')
            ->where("DATE(closed_at) = ", $today)
            ->countAllResults();

        $remaining = $maxTickets - $ticketsToday; // Versión simplificada

        return [
            'canCreate' => $remaining > 0,
            'message' => $remaining > 0 ? "Puedes crear {$remaining} tickets más hoy" : 'Límite diario alcanzado',
            'remaining' => $remaining
        ];
    }

    public function getTicketWithDetails($id)
    {
        $builder = $this->db->table($this->table);
        $builder->select('tickets.*, 
                         u1.first_name as user_first_name, u1.first_last_name as user_last_name,
                         u2.first_name as assigned_first_name, u2.first_last_name as assigned_last_name,
                         tc.name as category_name');
        $builder->join('users u1', 'u1.id = tickets.user_id', 'left');
        $builder->join('users u2', 'u2.id = tickets.assigned_to', 'left');
        $builder->join('ticket_categories tc', 'tc.id = tickets.category_id', 'left');
        $builder->where('tickets.id', $id);

        return $builder->get()->getRowArray();
    }

    public function getTicketComments($ticketId)
    {
        $commentModel = new TicketComment;
        return $commentModel->select('DISTINCT(tc.id), tc.*, u.first_name, u.first_last_name')
            ->from('ticket_comments tc')
            ->join('users u', 'tc.user_id = u.id')
            ->where('tc.ticket_id', $ticketId)
            ->orderBy('tc.created_at', 'ASC')
            ->findAll();
    }

    public function addHistory($ticketId, $field, $oldValue, $newValue)
    {
        $historyModel = new TicketHistory;
        $historyModel->save([
            'ticket_id' => $ticketId,
            'changed_by' => service('auth')->id(),
            'field_changed' => $field,
            'old_value' => $oldValue,
            'new_value' => $newValue
        ]);
    }

    public function getUserTickets($userId)
    {
        return $this->where('user_id', $userId)
            ->orderBy('created_at', 'DESC')
            ->findAll();
    }

    public function getAssignedTickets($userId)
    {
        return $this->where('assigned_to', $userId)
            ->orderBy('created_at', 'DESC')
            ->findAll();
    }

    public function getAllTickets()
    {
        return $this->orderBy('created_at', 'DESC')->findAll();
    }

    public function assignToTechnician(int $ticketId, int $categoryId): ?array
    {
        // Verificar si el ticket ya está asignado
        $existingAssignment = $this->db->table('technician_assignments')
            ->where('ticket_id', $ticketId)
            ->countAllResults();

        if ($existingAssignment > 0) {
            log_message('error', "Intento de reasignación del ticket {$ticketId}");
            return null;
        }

        // 1. Buscar técnico disponible
        $query = $this->db->query("
        SELECT u.id, u.username, COUNT(ta.id) AS workload
        FROM users u
        JOIN users_groups ug ON u.id = ug.user_id AND ug.group_id = 3
        JOIN user_categories uc ON u.id = uc.user_id AND uc.category_id = ?
        LEFT JOIN technician_assignments ta ON u.id = ta.technician_id AND ta.completed_at IS NULL
        GROUP BY u.id, u.username
        ORDER BY uc.is_primary DESC, workload ASC
        LIMIT 1
    ", [$categoryId]);

        $technician = $query->getRowArray();

        if (empty($technician)) {
            log_message('warning', "No se encontraron técnicos disponibles para la categoría {$categoryId}");
            return null;
        }

        // 2. Proceso de asignación (transacción)
        $this->db->transStart();

        try {
            // Actualizar ticket
            $this->db->table($this->table)
                ->where('id', $ticketId)
                ->update([
                    'assigned_to' => $technician['id'],
                    'status' => 'asignado',
                    'updated_at' => date('Y-m-d H:i:s')
                ]);

            // Registrar asignación
            $this->db->table('technician_assignments')->insert([
                'technician_id' => $technician['id'],
                'ticket_id' => $ticketId,
                'status' => 'asignado'
            ]);

            $this->db->transComplete();

            return $technician;
        } catch (\Exception $e) {
            $this->db->transRollback();
            log_message('error', "Error al asignar ticket: {$e->getMessage()}");
            return null;
        }
    }

    public function countActiveTickets(int $userId): int
    {
        return $this->builder()
            ->where('user_id', (int)$userId)
            ->where('status', 'abierto')
            ->countAllResults();
    }

    public function getRecentTickets(int $limit = 5, bool $includeClosed = false)
    {
        $builder = $this->builder()
            ->select('tickets.*, u.username as user_name, tc.name as category_name')
            ->join('users u', 'u.id = tickets.user_id')
            ->join('ticket_categories tc', 'tc.id = tickets.category_id', 'left')
            ->orderBy('created_at', 'DESC')
            ->limit($limit);

        if (!$includeClosed) {
            $builder->where('status !=', 'closed');
        }

        return $builder->get()->getResultArray();
    }

    // En TicketModel.php
    public function getTrendPercentage(): float
    {
        $currentMonth = $this->where("EXTRACT(MONTH FROM created_at) = ", date('m'))
            ->where("EXTRACT(YEAR FROM created_at) = ", date('Y'))
            ->countAllResults();

        $lastMonth = $this->where("EXTRACT(MONTH FROM created_at) = ", date('m', strtotime('-1 month')))
            ->where("EXTRACT(YEAR FROM created_at) = ", date('Y', strtotime('-1 month')))
            ->countAllResults();

        return $lastMonth ? round(($currentMonth - $lastMonth) / $lastMonth * 100, 2) : ($currentMonth ? 100 : 0);
    }

    public function getDailyTrend(): float
    {
        $today = $this->where("DATE(created_at) = ", date('Y-m-d'))
            ->countAllResults();

        $yesterday = $this->where("DATE(created_at) = ", date('Y-m-d', strtotime('-1 day')))
            ->countAllResults();

        return $yesterday ? round(($today - $yesterday) / $yesterday * 100, 2) : ($today ? 100 : 0);
    }

    public function getSolvedTrend(): float
    {
        $todaySolved = $this->where("DATE(closed_at) = ", date('Y-m-d'))
            ->where('status', 'cerrado')
            ->countAllResults();

        $yesterdaySolved = $this->where("DATE(closed_at) = ", date('Y-m-d', strtotime('-1 day')))
            ->where('status', 'cerrado')
            ->countAllResults();

        return $yesterdaySolved ? round(($todaySolved - $yesterdaySolved) / $yesterdaySolved * 100, 2) : ($todaySolved ? 100 : 0);
    }
}
