<?php

namespace Config;

class Permissions
{
    public $admin = [
        'edit_tickets',
        'reassign_tickets',
        'close_tickets',
        'comment_tickets',
        'view_all_tickets',
        'change_status_tickets'
    ];

    public $managers = [
        'edit_tickets',
        'reassign_tickets',
        'close_tickets',
        'view_all_tickets',
        'change_status_tickets'
    ];

    public $technical = [
        'edit_tickets',
        'close_tickets',
        'comment_tickets',
        'view_assigned_tickets',
        'change_status_tickets'
    ];

    public $members = [
        'create_tickets',
        'comment_tickets',
        'rate_tickets'
    ];
}
