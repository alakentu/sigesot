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

    /**
     * Sets the created_at timestamp for a new ticket.
     *
     * This beforeInsert handler sets the created_at field to the current date and time.
     *
     * @param array $data The data array to be inserted.
     * @return array The updated data array with the created_at field set to the current date and time.
     */
    protected function setCreatedAt(array $data)
    {
        $data['data']['created_at'] = date('Y-m-d H:i:s');
        return $data;
    }

    /**
     * Set the updated_at timestamp when a ticket is updated.
     *
     * @param array $data The data array to be updated.
     * @return array The updated data array with the updated_at field set to the current date and time.
     */
    protected function setUpdatedAt(array $data)
    {
        $data['data']['updated_at'] = date('Y-m-d H:i:s');
        return $data;
    }

    /**
     * Checks if a user has reached the daily ticket limit.
     *
     * @param int $userId The user ID to check.
     * @return array An associative array with the following keys:
     *               - canCreate: a boolean indicating if the user can create more tickets today.
     *               - message: a string with a message about the ticket limit.
     *               - remaining: the number of tickets remaining for the user to create today.
     */
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

    /**
     * Retrieves a ticket with details.
     *
     * This function fetches a ticket given its ID and includes the following
     * details:
     * - User details (first name, last name)
     * - Assigned user details (first name, last name)
     * - Category name
     *
     * @param int $id The ID of the ticket to retrieve.
     * @return array The ticket with its details.
     */
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

    /**
     * Registra un cambio en el historial de un ticket.
     *
     * @param int $ticketId ID del ticket relacionado.
     * @param string $field Nombre del campo que se ha modificado.
     * @param mixed $oldValue Valor anterior del campo.
     * @param mixed $newValue Valor nuevo del campo.
     *
     * @return void
     */
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

    /**
     * Retrieves tickets created by a specific user.
     *
     * This function fetches and returns all tickets that were created
     * by the given user ID. The tickets are ordered by their creation
     * date in descending order.
     *
     * @param int $userId The ID of the user who created the tickets.
     * @return array An array of tickets created by the user.
     */
    public function getUserTickets($userId)
    {
        return $this->where('user_id', $userId)
            ->orderBy('tickets.created_at', 'DESC')  // Especificar tabla
            ->findAll();
    }

    /**
     * Retrieves tickets assigned to a specific user.
     *
     * This function fetches and returns all tickets that are assigned
     * to the given user ID. The tickets are ordered by their creation
     * date in descending order.
     *
     * @param int $userId The ID of the user to whom tickets are assigned.
     * @return array An array of tickets assigned to the user.
     */
    public function getAssignedTickets($userId)
    {
        return $this->where('assigned_to', $userId)
            ->orderBy('tickets.created_at', 'DESC')  // Especificar tabla
            ->findAll();
    }

    public function getAllTickets()
    {
        return $this->orderBy('tickets.created_at', 'DESC')->findAll();
    }

    /**
     * Asigna un técnico a un ticket según su categoría.
     *
     * La función busca técnicos con la categoría dada y los ordena según su carga actual de trabajo.
     * Si no se encuentra un técnico, se registra un mensaje de warning y se devuelve null.
     * Si el ticket ya tiene un técnico asignado, se registra un mensaje de error y se devuelve null.
     *
     * @param int $ticketId ID del ticket a asignar.
     * @param int $categoryId ID de la categoría del ticket.
     * @return array|null Un array con los datos del técnico asignado o null si no se encontró.
     */
    public function assignToTechnician(int $ticketId, int $categoryId): ?array
    {
        $existingAssignment = $this->db->table('technician_assignments')
            ->where('ticket_id', $ticketId)
            ->countAllResults();

        if ($existingAssignment > 0) {
            log_message('error', "Intento de reasignación del ticket {$ticketId}");
            return null;
        }

        $query = $this->db->query("
        SELECT u.id, u.username, COUNT(ta.id) AS workload
        FROM users u
        JOIN users_groups ug ON u.id = ug.user_id AND ug.group_id = 3
        JOIN user_categories uc ON u.id = uc.user_id AND uc.category_id = ?
        LEFT JOIN technician_assignments ta ON u.id = ta.technician_id AND ta.status != 'completado'
        GROUP BY u.id, u.username
        ORDER BY uc.is_primary DESC, workload ASC
        LIMIT 1
    ", [$categoryId]);

        $technician = $query->getRowArray();

        if (empty($technician)) {
            log_message('warning', "No se encontraron técnicos para la categoría {$categoryId}");
            return null;
        }

        $this->db->table('technician_assignments')->insert([
            'technician_id' => $technician['id'],
            'ticket_id' => $ticketId,
            'status' => 'asignado',
            'assigned_at' => date('Y-m-d H:i:s')
        ]);

        return $technician;
    }

    /**
     * Counts the number of open tickets for the given user ID.
     *
     * @param int $userId The ID of the user to count open tickets for.
     * @return int The number of open tickets for the given user ID.
     */
    public function countActiveTickets(int $userId): int
    {
        return $this->builder()
            ->where('user_id', (int)$userId)
            ->where('status', 'abierto')
            ->countAllResults();
    }

    /**
     * Returns an array of recent tickets, ordered by creation date (newest first).
     * By default, only open tickets are returned, but you can include closed tickets
     * by setting the second parameter to true.
     *
     * @param int    $limit     The number of tickets to return.
     * @param bool   $includeClosed  Whether to include closed tickets in the results.
     * @return array  An array of ticket objects, each with the following properties:
     *               id, title, category_id, user_id, description, status, created_at,
     *               updated_at, user_name, category_name
     */
    public function getRecentTickets(int $limit = 5, bool $includeClosed = false)
    {
        $db = $this->db;

        // Construcción de la consulta SQL
        $sql = "SELECT 
                tickets.id as ticket_id,
                tickets.title,
                tickets.status,
                tickets.created_at as ticket_created_at,
                tickets.priority as priority,
                u.username as user_name,
                tc.name as category_name
            FROM 
                tickets
            JOIN 
                users as u ON u.id = tickets.user_id
            LEFT JOIN 
                ticket_categories as tc ON tc.id = tickets.category_id";

        // Condición para tickets cerrados
        if (!$includeClosed) {
            $sql .= " WHERE tickets.status != 'cerrado'";
        }

        // Orden y límite
        $sql .= " ORDER BY tickets.created_at DESC LIMIT ?";

        // Ejecución de la consulta
        $query = $db->query($sql, [$limit]);

        return $query->getResultArray();
    }

    /**
     * Calculate the percentage change in the number of tickets created from last month to current month.
     * If there are no tickets last month, consider the current month as 100%.
     * @return float
     */
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

    /**
     * Devuelve la tendencia diaria de tickets creados en %.
     * Se considera el n mero de tickets creados hoy vs ayer.
     * Si no hay tickets de ayer, se considera el 100%.
     * @return float
     */
    public function getDailyTrend(): float
    {
        $today = $this->where("DATE(created_at) = ", date('Y-m-d'))
            ->countAllResults();

        $yesterday = $this->where("DATE(created_at) = ", date('Y-m-d', strtotime('-1 day')))
            ->countAllResults();

        return $yesterday ? round(($today - $yesterday) / $yesterday * 100, 2) : ($today ? 100 : 0);
    }

    /**
     * Calculate the percentage change in the number of solved tickets from yesterday to today.
     *
     * This method compares the count of tickets marked as 'cerrado' (closed)
     * for the current day with the count from the previous day. It returns
     * the percentage increase or decrease in the number of solved tickets.
     *
     * @return float The percentage change in solved tickets from yesterday to today.
     *               If there were no solved tickets yesterday, it returns 100 if there
     *               are solved tickets today, otherwise returns 0.
     */

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

    public function countUserTickets(int $userId): int
    {
        $builder = $this->builder()
            ->where('user_id', $userId)
            ->where('created_at =', date('Y-m-d'));

        return $builder->countAllResults();
    }

    public function getAssignedTech(int $ticketId): ?array
    {
        return $this->db->table('technician_assignments ta')
            ->select('u.id, u.username, u.email')
            ->join('users u', 'u.id = ta.technician_id')
            ->where('ta.ticket_id', $ticketId)
            ->get()
            ->getRowArray();
    }
}
