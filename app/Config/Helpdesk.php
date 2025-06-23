<?php

namespace Config;

use CodeIgniter\Config\BaseConfig;

class Helpdesk extends BaseConfig
{
    public $max_tickets_per_user = 3;
    public $ticket_attachment_max_size = 5120; // 5MB en KB
    public $allowed_file_types = [
        'image/jpeg',
        'image/png',
        'application/pdf',
        'application/msword',
        'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
    ];
}
