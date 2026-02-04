<?php

namespace App\Controllers;

use CodeIgniter\Controller;
use CodeIgniter\HTTP\IncomingRequest;
use CodeIgniter\HTTP\RequestInterface;
use CodeIgniter\HTTP\ResponseInterface;
use Psr\Log\LoggerInterface;
use CodeIgniter\HTTP\URI;
use App\Libraries\IonAuth;
use App\Libraries\Template;
use App\Models\IonAuthModel;
use App\Models\Settings;

/**
 * Class BaseController
 *
 * BaseController provides a convenient place for loading components
 * and performing functions that are needed by all your controllers.
 * Extend this class in any new controllers:
 *     class Home extends BaseController
 *
 * For security be sure to declare any new methods as protected or private.
 */
abstract class BaseController extends Controller
{
    /**
     * Be sure to declare properties for any property fetch you initialized.
     * The creation of dynamic property is deprecated in PHP 8.2.
     */
    protected $session;

    protected $uri;

    protected $validation;

    protected $router;

    protected $db;

    protected $auth;

    protected $template;

    protected $admins;

    protected $mauth;

    protected $cauth;

    protected $settings;

    protected $validationListTemplate = 'list';

    protected $siteconfig;

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
        $this->cauth        = config('Config\\Auth');
        $this->uri          = \Config\Services::uri();
        $this->auth         = new IonAuth;
        $this->template     = new Template;

        // Models
        $this->mauth        = new IonAuthModel;
        $this->settings     = new Settings;
        $this->siteconfig   = $this->settings->getConfig();

        /**
         * Set default data
         *
         * return array $data
         */
        $this->data = [
            'template'      => $this->template,
            'settings'      => $this->settings->getConfig(),
            'uri'           => $this->uri,
            'session'       => $this->session,
            'router'        => $this->router,
            'validation'    => $this->validation,
            'auth'          => $this->auth,
            'mauth'         => $this->mauth,
            'admins'        => $this->admins,
            'page_title'    => $this->siteconfig->name,
            'request'       => $request,
        ];

        if (!empty($this->cauth->templates['errors']['list'])) {
            $this->validationListTemplate = $this->cauth->templates['errors']['list'];
        }
    }
}
