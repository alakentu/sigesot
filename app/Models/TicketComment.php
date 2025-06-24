<?php

namespace App\Models;

use CodeIgniter\Model;

class TicketComment extends Model
{
    protected $table            = 'ticket_comments';
    protected $primaryKey       = 'id';
    protected $useAutoIncrement = true;
    protected $returnType       = 'array';
    protected $useSoftDeletes   = false;
    protected $protectFields    = true;
    protected $allowedFields    = ['ticket_id', 'user_id', 'comment', 'is_internal', 'created_at'];

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
     * Retrieves comments associated with a specific ticket.
     *
     * This function fetches and returns all comments related to the given ticket ID.
     * It includes user details such as first name and last name for each comment.
     * The comments are ordered by their creation date in ascending order.
     *
     * @param int $ticketId The ID of the ticket for which comments are retrieved.
     * @return array An array of ticket comments with user details.
     */
    public function getTicketComments($ticketId)
    {
        return $this->select('DISTINCT(tc.id), tc.*, u.first_name, u.first_last_name, u.photo')
            ->from('ticket_comments tc')
            ->join('users u', 'u.id = tc.user_id')
            ->where('tc.ticket_id', $ticketId)
            ->orderBy('tc.created_at', 'ASC')
            ->findAll();
    }

    /**
     * Adds a new comment to a ticket.
     *
     * This function adds a comment to a ticket. The comment is linked to the given user ID.
     * The comment's internal flag is set according to the given boolean value. The comment's
     * creation date is set to the current date and time.
     *
     * @param int    $ticketId The ID of the ticket to which the comment is added.
     * @param int    $userId   The ID of the user who added the comment.
     * @param string $comment  The comment content.
     * @param bool   $isInternal Whether the comment is internal or not.
     * @return bool Whether the operation was successful or not.
     */
    public function addTicketComments(int $ticketId, int $userId, string $comment, bool $isInternal = false)
    {
        $data = [
            'ticket_id'    => $ticketId,
            'user_id'      => $userId,
            'comment'      => $comment,
            'is_internal'  => $isInternal,
            'created_at'   => date('Y-m-d H:i:s')
        ];

        return $this->insert($data);
    }
}
