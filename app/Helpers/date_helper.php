<?php

declare(strict_types=1);

/**
 * This file is part of CodeIgniter 4 framework.
 *
 * (c) CodeIgniter Foundation <admin@codeigniter.com>
 *
 * For the full copyright and license information, please view
 * the LICENSE file that was distributed with this source code.
 */

use CodeIgniter\I18n\Time;

// CodeIgniter Date Helpers

if (!function_exists('timeAgo')) {
    function timeAgo($datetime)
    {
        $time = strtotime($datetime);
        $now = time();
        $diff = $now - $time;

        if ($diff < 60) {
            return 'Hace unos segundos';
        } elseif ($diff < 3600) {
            $mins = floor($diff / 60);
            return "Hace $mins minuto" . ($mins > 1 ? 's' : '');
        } elseif ($diff < 86400) {
            $hours = floor($diff / 3600);
            return "Hace $hours hora" . ($hours > 1 ? 's' : '');
        } elseif ($diff < 2592000) {
            $days = floor($diff / 86400);
            return "Hace $days día" . ($days > 1 ? 's' : '');
        } else {
            return date('d M Y', $time);
        }
    }
}
