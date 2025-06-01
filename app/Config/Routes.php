<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */
$routes->group('', ['namespace' => 'App\Controllers'], static function ($routes) {
    $routes->get('/', 'Home::login');
});

$routes->group('admin', ['namespace' => 'App\Controllers\Admin'], static function ($routes) {
    $routes->get('/', 'Dashboard::index');

    $routes->group('auth', ['namespace' => 'App\Controllers\Admin'], static function ($routes) {
        $routes->match(['GET', 'POST'], 'login', 'Auth::login', ['as' => 'login']);
        $routes->match(['GET', 'POST'], 'register', 'Auth::register', ['as' => 'register']);
        $routes->match(['GET', 'POST'], 'logout', 'Auth::logout', ['as' => 'logout']);
    });

    $routes->group('users', ['namespace' => 'App\Controllers\Admin'], static function ($routes) {
        $routes->get('/', 'Users::index');
        $routes->post('usersdata', 'Users::getUsersData');
        $routes->post('changestatus', 'Users::changeUserStatus');
        $routes->post('adduser', 'Users::createUser');
    });

    $routes->group('reports', ['namespace' => 'App\Controllers\Admin'], static function ($routes) {
        $routes->get('/', 'Reports::index');
    });

    $routes->group('audit', ['namespace' => 'App\Controllers\Admin'], static function ($routes) {
        $routes->get('/', 'Audit::index');
    });

    $routes->group('requests', ['namespace' => 'App\Controllers\Admin'], static function ($routes) {
        $routes->get('/', 'Requests::index');
    });

    $routes->group('inventory', ['namespace' => 'App\Controllers\Admin'], static function ($routes) {
        $routes->get('/', 'Inventory::index');
    });
});
