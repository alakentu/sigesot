<?php

namespace App\Controllers\Admin;

use CodeIgniter\Controller;
use CodeIgniter\HTTP\CLIRequest;
use CodeIgniter\HTTP\IncomingRequest;
use CodeIgniter\HTTP\RequestInterface;
use CodeIgniter\HTTP\ResponseInterface;
use Psr\Log\LoggerInterface;
use App\Libraries\IonAuth;
use App\Libraries\Breadcrumbs;
use App\Libraries\Serverside;
use App\Libraries\Template;
use App\Models\IonAuthModel;
use App\Models\Settings;
use App\Models\Users;
use App\Models\Audit;
use App\Models\Ticket;
use App\Models\TicketCategory;

/**
 * Class AdminController
 *
 * AdminController provides a convenient place for loading components
 * and performing functions that are needed by all your controllers.
 * Extend this class in any new controllers:
 *     class Home extends AdminController
 *
 * For security be sure to declare any new methods as protected or private.
 */
abstract class AdminController extends Controller
{
    /**
     * Instance of the main Request object.
     *
     * @var CLIRequest|IncomingRequest
     */
    protected $request;

    /**
     * An array of helpers to be loaded automatically upon
     * class instantiation. These helpers will be available
     * to all other controllers that extend AdminController.
     *
     * @var list<string>
     */
    protected $helpers = ['form', 'url', 'html', 'text', 'cookie', 'date'];

    /**
     * Be sure to declare properties for any property fetch you initialized.
     * The creation of dynamic property is deprecated in PHP 8.2.
     */
    protected $session;

    protected $uri;

    protected $validation;

    protected $router;

    protected $db;

    protected $cache;

    protected $auth;

    protected $breadcrumb;

    protected $serverside;

    protected $template;

    protected $mauth;

    protected $cauth;

    protected $settings;

    protected $users;

    protected $audit;

    protected $ticket;

    protected $category;

    protected $siteconfig;

    protected $validationListTemplate = 'list';

    protected $toolbar;

    protected $data = [];

    /**
     * @return void
     */
    public function initController(RequestInterface $request, ResponseInterface $response, LoggerInterface $logger)
    {
        // Do Not Edit This Line
        parent::initController($request, $response, $logger);

        $this->session      = \Config\Services::session();
        $this->validation   = \Config\Services::validation();
        $this->router       = \Config\Services::router();
        $this->db           = \Config\Database::connect();
        $this->cache        = \Config\Services::cache();
        $this->cauth        = config('Config\\Auth');
        $this->uri          = (string) $request->getUri();
        $this->auth         = new IonAuth;
        $this->breadcrumb   = new Breadcrumbs;
        $this->serverside   = new Serverside;
        $this->template     = new Template;
        $this->mauth        = new IonAuthModel;
        $this->settings     = new Settings;
        $this->users        = new Users;
        $this->audit        = new Audit;
        $this->ticket       = new Ticket;
        $this->category     = new TicketCategory;
        $this->siteconfig   = $this->settings->getConfig();

        $this->data = [
            'template'              => $this->template,
            'settings'              => $this->settings->getConfig(),
            'uri'                   => $this->uri,
            'session'               => $this->session,
            'router'                => $this->router,
            'validation'            => $this->validation,
            'auth'                  => $this->auth,
            'cauth'                 => $this->cauth,
            'mauth'                 => $this->mauth,
            'breadcrumb'            => $this->breadcrumb->build(),
            'db'                    => $this->db,
            'request'               => $request,
            'page_title'            => $this->siteconfig->name,
            'siteconfig'            => $this->siteconfig,
            'user_name'             => $this->session->first_name,
            'user_role'             => $this->session->role,
            'user_photo'            => $this->session->photo,
        ];

        if (!empty($this->cauth->templates['errors']['list'])) {
            $this->validationListTemplate = $this->cauth->templates['errors']['list'];
        }
    }
}
