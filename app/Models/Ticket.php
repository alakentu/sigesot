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
        $maxTickets = 3;
        $today = date('Y-m-d');

        // Tickets creados hoy
        $ticketsToday = $this->where('user_id', $userId)
            ->where('DATE(created_at)', $today)
            ->countAllResults();

        // Tickets resueltos hoy
        $resolvedToday = $this->where('user_id', $userId)
            ->where('status', 'cerrado')
            ->where('DATE(closed_at)', $today)
            ->countAllResults();

        $remaining = $maxTickets - ($ticketsToday - $resolvedToday);

        if ($remaining <= 0) {
            return [
                'canCreate' => false,
                'message' => 'Has alcanzado tu límite de tickets por hoy. Intenta mañana o espera que se resuelvan tus tickets pendientes.',
                'remaining' => 0
            ];
        }

        return [
            'canCreate' => true,
            'message' => '',
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
        return $commentModel->where('ticket_id', $ticketId)
            ->orderBy('created_at', 'ASC')
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

    public function assignToTechnician($ticketId, $technicianId)
    {
        $ticket = $this->find($ticketId);
        if (!$ticket) return false;

        $updateData = [
            'assigned_to' => $technicianId,
            'status' => 'en_progreso'
        ];

        if ($this->update($ticketId, $updateData)) {
            $this->addHistory($ticketId, 'assigned_to', $ticket['assigned_to'], $technicianId);
            $this->addHistory($ticketId, 'status', $ticket['status'], 'en_progreso');
            return true;
        }

        return false;
    }
}
