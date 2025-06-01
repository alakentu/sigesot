<?php

/**
 * Template Library
 *
 * @package		Octopus Framework
 * @copyright  	(C) 2021 Gonzalo R. Meneses. <alakentu2003@hotmail.com>
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace App\Libraries;

/**
 * This class is the Template library.
 */
class Template
{
	/**
	 * Data that is made available to the Views.
	 *
	 * @var array
	 */
	protected $data = [];

	protected $session;

	protected $router;

	protected $uri;

	/**
	 * @var string
	 */
	public $line_end = "\n\t";

	/**
	 * Favicon icon for website (backend/frontend)
	 *
	 * @var string
	 */
	public $favicon;

	public $ip_address;

	/**
	 * Detect language browser
	 *
	 * @var string
	 */
	public $language;

	/**
	 * Body classes
	 *
	 * @var string
	 */
	public $bodyclass;

	public $controller;

	public $method;

	public $view;

	public $avatar;

	public $profile;

	public $welcome;

	public $fullname;

	public $name;

	public $script;

	public $cssfile;

	public $jsfile;

	public $toolbar;

	public $breadcrumb;

	public $time;

	public $current_time;

	/**
	 * __construct
	 *
	 */
	public function __construct()
	{
		$this->session 		= \Config\Services::session();
		$this->router		= \Config\Services::router();
		$this->uri			= \Config\Services::uri();

		$this->language 	= $this->get_lang();
		$this->bodyclass	= $this->set_body_class();
		$this->controller	= $this->getController();
		$this->method		= $this->getMethod();
		$this->view			= $this->getView();
		$this->fullname		= $this->get_full_username();
		$this->avatar		= $this->get_user_avatar();
		$this->profile		= $this->get_profile_page();
		$this->welcome		= $this->getWelcome();
		$this->breadcrumb 	= $this->loadBreadcrumb();
		$this->favicon 		= $this->add_favicon();
		$this->ip_address 	= $this->get_real_ip();
		$this->time 		= 1300;
		$this->current_time = (int) date('Hi');
	}

	/**
	 * Renderiza la vista especificada
	 *
	 * @param string     $view       El nombre del archivo a cargar
	 * @param array|null $data       Un array de pares clave/valor para poner a disposición dentro de la vista.
	 * @param boolean    $returnHtml Sí es true retorna una cadena html
	 *
	 * @return string|void
	 */
	public function render(string $view, $data = null, bool $returnHtml = true)
	{
		if (is_object($data)) {
			$data = get_object_vars($data);
		}

		if (empty($data) || !is_array($data)) {
			$data = [];
		}

		$viewdata = $data ?: $this->data;

		$viewHtml = view('layouts/html/header', $viewdata);
		$viewHtml .= view($view, $viewdata);
		$viewHtml .= view('layouts/html/footer', $viewdata);

		if ($returnHtml) {
			return $viewHtml;
		} else {
			echo $viewHtml;
		}
	}

	/**
	 * Check the client interface by name.
	 *
	 * @param   string  $identifier  String identifier for the application interface
	 *
	 * @return  boolean  True if this application is of the given type client interface.
	 */
	public function isClient($identifier)
	{
		if ($this->uri->getTotalSegments() === 0) {
			$segment = $this->uri->setPath('site');
			return $segment === $identifier ? true : false;
		} else {
			foreach ($this->uri->getSegments() as $segment) {
				return $segment === $identifier ? true : false;
			}
		}
	}

	/**
	 * Obtenemos el idioma del navegador del usuario
	 *
	 * @return [string]		Idioma código/prefijo
	 */
	public function get_lang()
	{
		if (isset($_SERVER['HTTP_ACCEPT_LANGUAGE'])) {
			$lang = substr($_SERVER['HTTP_ACCEPT_LANGUAGE'], 0, 2);
		}
		return $lang;
	}

	/**
	 * Load specified layout into view
	 *
	 * @param string 	$layout The name of the layout to show
	 *
	 * @return string|void
	 */
	public function load_layout(string $layout): string
	{
		return view('layouts/html/' . $layout, $this->data);
	}

	/**
	 * Load Headers Function
	 *
	 * Load CSS files inside the page header,
	 * depending on the platform (Admin/Fronted)
	 *
	 * @return string
	 */
	public function load_headers()
	{
		$output 	= '';
		$use_style 	= $this->add_css_file($this->cssfile) ? $this->add_css_file($this->cssfile) . ',' : '';
		$useStyle 	= $this->add_file($this->name) ? $this->add_file($this->name) . ',' : '';

		if ($this->isClient('site') || $this->isClient('login')) {
			$output .= $this->add_files('css', 'bootstrap,bootstrap-icons,' . $useStyle . $use_style . 'app,custom');
			$output .= $this->add_favicon();
		} elseif ($this->isClient('site') && $this->isClient('register')) {
			$output .= $this->add_files('css', 'bootstrap,bootstrap-icons,intlTelInput,nice-select,' . $useStyle . $use_style . 'app,custom');
			$output .= $this->add_favicon();
		} elseif ($this->isClient('admin')) {
			$output .= $this->add_files('css', 'bootstrap,bootstrap-icons,vendor/jsvectormap/jsvectormap,vendor/swiper/swiper-bundle,vendor/swiper/swiper-bundle,' . $useStyle . $use_style . 'app,custom');
			$output .= $this->add_favicon();
		}

		return $output;
	}

	/**
	 * Load Footer Function
	 *
	 * Load JS files inside the page header,
	 * depending on the platform (Admin/Fronted)
	 *
	 * @return string
	 */
	public function load_footer(): string
	{
		$output 		= '';
		$use_script 	= $this->add_js_file($this->jsfile) ? $this->add_js_file($this->jsfile) . ',' : '';
		$useScript 		= $this->add_file($this->name) ? $this->add_file($this->name) . ',' : '';
		$inline 		= $this->add_inline($this->script) ? '<script>' . $this->add_inline($this->script) . '</script>' : '';

		if ($this->isClient('site') || $this->isClient('login')) {
			$output .= $this->add_files('js', 'vendor.bundle,vendor/simplebar/simplebar,vendor/node-waves/waves,plugins,vendor/particles/particles,vendor/particles/particles.app,' . $useScript . $use_script . 'template');
			$output .= $inline;
		} elseif ($this->isClient('site') && $this->isClient('register')) {
			$output .= $this->add_files('js', 'vendor.bundle,jquery.easing,intlTelInput,jquery.nice-select,' . $useScript . $use_script . 'template');
			$output .= $inline;
		} elseif ($this->isClient('admin')) {
			$output .= $this->add_files('js', 'vendor.bundle,vendor/simplebar/simplebar,vendor/node-waves/waves,plugins,vendor/apexcharts/apexcharts,vendor/jsvectormap/jsvectormap,vendor/jsvectormap/maps/world-merc,vendor/swiper/swiper-bundle,' . $useScript . $use_script . 'app');
			$output .= $inline;
		}

		return $output;
	}

	/**
	 * Add files
	 *
	 * Load a specific script/style files depending on the requirement
	 *
	 * @return string
	 */
	public function add_file(string $name = null): ?string
	{
		return $this->name = $name;
	}

	/**
	 * Add CSS file
	 *
	 * Load a only one CSS file in the header page
	 *
	 * @return string
	 */
	public function add_css_file(string $file = null): ?string
	{
		return $this->cssfile = $file;
	}

	/**
	 * Add JS file
	 *
	 * Load a only one JS file in the footer page
	 *
	 * @return string
	 */
	public function add_js_file(string $file = null): ?string
	{
		return $this->jsfile = $file;
	}

	/**
	 * Add script
	 *
	 * Add script variables to the footer depending on the requirement
	 *
	 * @return string
	 */
	public function add_inline(string $script = null): ?string
	{
		return $this->script = $script;
	}

	/**
	 * Agrega archivos css a la cabecera y
	 * agrega archivos js al footer de la página
	 *
	 * @param   string  $type     Tipo de archivo enlazado
	 * @param   string  $files    Archivos enlazado
	 *
	 * @return  archivo css o js
	 */
	public function add_files($type, $files, $defer = null, $async = null): string
	{
		$output 		= '';
		$explode_files 	= explode(",", $files);
		$defer			= ($defer == true) ? ' defer' : '';
		$async			= ($async == true) ? ' async' : '';
		$path_js 		= site_url('assets/js/');
		$path_css 		= site_url('assets/css/');
		switch ($type) {
			case 'js':
				foreach ($explode_files as $file) {
					$js = htmlspecialchars(strip_tags($path_js . trim($file)));

					$output .= '<script src="' . $js . '.min.js" crossorigin="anonymous"' . $defer . $async . '></script>' . $this->line_end;
				}
				break;
			case 'css':
				foreach ($explode_files as $file) {
					$css = htmlspecialchars(addslashes(strip_tags($path_css . trim($file))));

					$output .= '<link crossorigin="anonymous" href="' . $css . '.min.css" rel="stylesheet">' . $this->line_end;
				}
				break;
		}

		return $output;
	}

	public function inline_script(string $string): string
	{
		$script = '<script>' . $string . '</script>';

		return $script;
	}

	/**
	 * Add a shortcut icon (favicon)
	 *
	 * @return  string Favicon icon image url
	 */
	public function add_favicon(): string
	{
		$href = site_url('assets/images/icons/');
		$icon = '<link rel="apple-touch-icon" sizes="57x57" href="' . $href . 'apple-icon-57x57.png">' . $this->line_end;
		$icon .= '<link rel="apple-touch-icon" sizes="60x60" href="' . $href . 'apple-icon-60x60.png">' . $this->line_end;
		$icon .= '<link rel="apple-touch-icon" sizes="72x72" href="' . $href . 'apple-icon-72x72.png">' . $this->line_end;
		$icon .= '<link rel="apple-touch-icon" sizes="76x76" href="' . $href . 'apple-icon-76x76.png">' . $this->line_end;
		$icon .= '<link rel="apple-touch-icon" sizes="114x114" href="' . $href . 'apple-icon-114x114.png">' . $this->line_end;
		$icon .= '<link rel="apple-touch-icon" sizes="120x120" href="' . $href . 'apple-icon-120x120.png">' . $this->line_end;
		$icon .= '<link rel="apple-touch-icon" sizes="144x144" href="' . $href . 'apple-icon-144x144.png">' . $this->line_end;
		$icon .= '<link rel="apple-touch-icon" sizes="152x152" href="' . $href . 'apple-icon-152x152.png">' . $this->line_end;
		$icon .= '<link rel="apple-touch-icon" sizes="180x180" href="' . $href . 'apple-icon-180x180.png">' . $this->line_end;
		$icon .= '<link rel="icon" type="image/png" sizes="192x192"  href="' . $href . 'android-icon-192x192.png">' . $this->line_end;
		$icon .= '<link rel="icon" type="image/png" sizes="32x32" href="' . $href . 'favicon-32x32.png">' . $this->line_end;
		$icon .= '<link rel="icon" type="image/png" sizes="96x96" href="' . $href . 'favicon-96x96.png">' . $this->line_end;
		$icon .= '<link rel="icon" type="image/png" sizes="16x16" href="' . $href . 'favicon-16x16.png">' . $this->line_end;
		$icon .= '<link rel="manifest" href="' . $href . 'manifest.json">' . $this->line_end;
		$icon .= '<meta name="msapplication-TileColor" content="#ffffff">' . $this->line_end;
		$icon .= '<meta name="msapplication-TileImage" content="' . $href . 'ms-icon-144x144.png">' . $this->line_end;
		$icon .= '<meta name="theme-color" content="#ffffff">' . $this->line_end;

		return $icon;
	}

	public function set_date()
	{
		$dtz = new \DateTimeZone("America/Caracas");
		$now = new \DateTime(date("Y-m-d"), $dtz);
		return $now->format("d-m-Y");
	}

	public function datenow()
	{
		if ($this->language == 'es') {
			setlocale(LC_TIME, 'es_ES.UTF-8', 'es.UTF-8', 'es_ES', 'Spanish_Spain', 'Spanish');
		}
		$dtz 		= new \DateTimeZone("America/Caracas");
		$dtobj 		= new \DateTime(date("Y-m-d"), $dtz);
		$dformat	= \IntlDateFormatter::formatObject($dtobj, "eeee, dd 'De' MMMM 'Del' YYYY", 'es_ES');

		$datenow = ucwords($dformat);
		$conv 	 = array("De" => "de", "Del" => "de");
		return strtr($datenow, $conv);
	}

	public function set_time()
	{
		$dtz = new \DateTimeZone("America/Caracas");
		$now = new \DateTime(date("Y-m-d"), $dtz);
		return $now->format("H:i:s");
	}

	/**
	 * Verifica la IP del usuario
	 *
	 * @return IP
	 */
	public function get_real_ip()
	{
		// Verificamos si la IP es una conexión compartida.
		$share_ip = isset($_SERVER['HTTP_CLIENT_IP']) ? $_SERVER['HTTP_CLIENT_IP'] : '';

		// Verificamos si la IP pasa por un proxy
		$proxy_ip = isset($_SERVER['HTTP_X_FORWARDED_FOR']) ? $_SERVER['HTTP_X_FORWARDED_FOR'] : '';

		// Obtenemos la dirección IP desde la cual está viendo la página actual el usuario.
		$real_ip = isset($_SERVER['REMOTE_ADDR']) ? $_SERVER['REMOTE_ADDR'] : '';

		if (!empty($share_ip)) {
			$ip = $share_ip;
		} else if (!empty($proxy_ip)) {
			$ip = $proxy_ip;
		} else {
			$ip = $real_ip;
		}

		return $ip;
	}

	/**
	 * Set the classes for the page body
	 *
	 * @return  string Body classes
	 */
	public function set_body_class(): string
	{
		$matched 	= $this->router->getMatchedRouteOptions();
		$method 	= $this->getMethod();
		$controller = $this->getController();

		if ($this->isClient('admin')) {
			$classes = ' class="admin view-' . $controller . ' ' . $method . ' page-' . $method . ' lang-' . $this->language . ' d-flex flex-column h-100"';
		} else {
			$classes = ' class="site view-' . $controller . ' ' . $method . ' page-' . $method . ' lang-' . $this->language . '"';
		}

		return $classes;
	}

	public function redirectUser()
	{
		$auth = new \App\Libraries\IonAuth();

		if ($auth->isAdmin()) {
			return redirect()->to('/auth');
		}

		return redirect()->to('/');
	}

	public function getWelcome()
	{
		$user = $this->session->first_name;
		$hour = date('G');

		if ($hour >= 5 && $hour <= 11) {
			$welcome = 'Buenos Días, ' . $user . '!';
		} else if ($hour >= 12 && $hour <= 18) {
			$welcome = 'Buenos Tardes, ' . $user . '!';
		} else if ($hour >= 19 || $hour <= 4) {
			$welcome = 'Buenos Noches, ' . $user . '!';
		}

		$html = '<div class="flex-grow-1">';
		$html .= '<h4 class="fs-16 mb-1">' . $welcome . '</h4>';
		$html .= '<p class="text-muted mb-0">Esto es lo que está sucediendo en el sistema hoy.</p>';
		$html .= '</div>';

		return $html;
	}

	public function greetings()
	{
		$hour = date('G');

		if ($hour >= 5 && $hour <= 11) {
			$welcome = 'Buenos Días!';
		} else if ($hour >= 12 && $hour <= 18) {
			$welcome = 'Buenas Tardes!';
		} else if ($hour >= 19 || $hour <= 4) {
			$welcome = 'Buenas Noches!';
		}

		return $welcome;
	}

	public function setTypeRecord()
	{
		$hmtl = '';

		if ($this->current_time > $this->time) {
			$hmtl .= '<input type="hidden" name="type_reg" value="salida">';
		} else {
			$hmtl .= '<input type="hidden" name="type_reg" value="entrada">';
		}

		return $hmtl;
	}

	/**
	 * Get the full name of the user per established session
	 *
	 * @return  string Full user name
	 */
	public function get_full_username(): string
	{
		$name = $this->session->first_name . ' ' . $this->session->first_last_name;
		$full_name = !isset($name) ? '' : $name;
		return $full_name;
	}

	/**
	 * Sets the url to the user's avatar per established session
	 *
	 * @return  string User's Avatar Url
	 */
	public function get_user_avatar(): string
	{
		$user_image = ($this->session->photo == null) ? 'assets/profiles/default.jpg' : $this->session->photo;
		return site_url($user_image);
	}

	/**
	 * Sets the url to the user's profile per established session
	 *
	 * @return  string User's Profile Url
	 */
	public function get_profile_page(): string
	{
		if ($this->isClient('admin')) {
			$url = 'admin/users/profile?user_id=' . $this->session->get('user_id');
		} else {
			$url = 'site/users/profile?user_id=' . $this->session->get('user_id');
		}

		$profile_url = ($this->session->get('user_id') == null) ? '' : $url;

		return site_url($profile_url);
	}

	public function loadBreadcrumb()
	{
		$breadcrumb = new Breadcrumbs;

		return $breadcrumb->build();
	}

	/**
	 * We easily get the name of the controller
	 *
	 * @return  string Controller name
	 */
	private function getController(): string
	{
		$controller = explode('\\', $this->router->controllerName());
		$controller = strtolower(end($controller));
		return $controller;
	}

	/**
	 * We easily get the name of the method
	 *
	 * @return  string Method name
	 */
	private function getMethod(): string
	{
		$method	= explode('\\', $this->router->methodName());
		$method	= strtolower(end($method));
		return $method;
	}

	/**
	 * We easily get the name of the method
	 *
	 * @return  string Method name
	 */
	private function getView(): string
	{
		$view	= explode('\\', $this->router->controllerName());
		$view	= strtolower(end($view));
		return 'view-' . $view;
	}

	public function setDatePicker($datestart = '#datestart', $dateend = '#dateend', $format = 'yy-mm-dd')
	{
		if ($this->language == "es") {
			$monthnames = '["Enero","Febrero","Marzo","Abril","Mayo","Junio", "Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"]';
			$monthshort = '["Ene","Feb","Mar","Abr","May","Jun", "Jul","Ago","Sep","Oct","Nov","Dic"]';
			$daynames = '["Domingo","Lunes","Martes","Miércoles","Jueves","Viernes","Sábado"]';
			$dayshort = '["Dom","Lun","Mar","Mié","Juv","Vie","Sáb"]';
			$daymin = '["Do","Lu","Ma","Mi","Ju","Vi","Sa"]';
		} else {
			$monthnames = '["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]';
			$monthshort = '["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]';
			$daynames = '["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]';
			$dayshort = '["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]';
			$daymin = '["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"]';
		}
		$html = '$.datepicker.regional["' . $this->language . '"] = {' . "\n";
		$html .= ' closeText: "' . lang('Site.GlobalClose') . '",' . "\n";
		$html .= ' prevText: "' . lang('Site.DatepickerPrev') . '",' . "\n";
		$html .= ' nextText: "' . lang('Site.DatepickerNext') . '",' . "\n";
		$html .= ' currentText: "' . lang('Site.DatepickerCurrent') . '",' . "\n";
		$html .= ' monthNames: ' . $monthnames . ',' . "\n";
		$html .= ' monthNamesShort: ' . $monthshort . ',' . "\n";
		$html .= ' dayNames: ' . $daynames . ',' . "\n";
		$html .= ' dayNamesShort: ' . $dayshort . ',' . "\n";
		$html .= ' dayNamesMin: ' . $daymin . ',' . "\n";
		$html .= ' weekHeader: "Sm",' . "\n";
		$html .= ' dateFormat: "' . $format . '",' . "\n";
		$html .= ' firstDay: 1,' . "\n";
		$html .= ' isRTL: false,' . "\n";
		$html .= ' showMonthAfterYear: false,' . "\n";
		$html .= ' yearSuffix: ""' . "\n";
		$html .= '};' . "\n\n";
		$html .= '$.datepicker.setDefaults($.datepicker.regional["' . $this->language . '"], {' . "\n";
		$html .= ' dateFormat: "' . $format . '"' . "\n";
		$html .= '});' . "\n\n";
		$html .= '$("' . $datestart . '").datepicker().datepicker("setDate", new Date());' . "\n";
		$html .= '$("' . $dateend . '").datepicker().datepicker("setDate", new Date());' . "\n\n";
		return $html;
	}

	public function pdfLogoImage()
	{
		$image = 'data:image/png;base64,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';

		return $image;
	}

	public function headerImage()
	{
		$image = ' data:image/jpeg;base64,/9j/4AAQSkZJRgABAgEASABIAAD/7QAsUGhvdG9zaG9wIDMuMAA4QklNA+0AAAAAABAASAAAAAEAAQBIAAAAAQAB/+E4Umh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8APD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS42LWMxNDUgNzkuMTYzNDk5LCAyMDE4LzA4LzEzLTE2OjQwOjIyICAgICAgICAiPgogICA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPgogICAgICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgICAgICAgICB4bWxuczpkYz0iaHR0cDovL3B1cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8iCiAgICAgICAgICAgIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIKICAgICAgICAgICAgeG1sbnM6eG1wR0ltZz0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL2cvaW1nLyIKICAgICAgICAgICAgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iCiAgICAgICAgICAgIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIgogICAgICAgICAgICB4bWxuczpzdEV2dD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlRXZlbnQjIgogICAgICAgICAgICB4bWxuczpzdE1mcz0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL01hbmlmZXN0SXRlbSMiCiAgICAgICAgICAgIHhtbG5zOmlsbHVzdHJhdG9yPSJodHRwOi8vbnMuYWRvYmUuY29tL2lsbHVzdHJhdG9yLzEuMC8iCiAgICAgICAgICAgIHhtbG5zOnBkZj0iaHR0cDovL25zLmFkb2JlLmNvbS9wZGYvMS4zLyIKICAgICAgICAgICAgeG1sbnM6cGRmeD0iaHR0cDovL25zLmFkb2JlLmNvbS9wZGZ4LzEuMy8iPgogICAgICAgICA8ZGM6Zm9ybWF0PmltYWdlL2pwZWc8L2RjOmZvcm1hdD4KICAgICAgICAgPGRjOnRpdGxlPgogICAgICAgICAgICA8cmRmOkFsdD4KICAgICAgICAgICAgICAgPHJkZjpsaSB4bWw6bGFuZz0ieC1kZWZhdWx0Ij5jaW50aWxsb19iYW5tdWplcjwvcmRmOmxpPgogICAgICAgICAgICA8L3JkZjpBbHQ+CiAgICAgICAgIDwvZGM6dGl0bGU+CiAgICAgICAgIDx4bXA6Q3JlYXRvclRvb2w+QWRvYmUgSWxsdXN0cmF0b3IgQ0MgMjMuMCAoV2luZG93cyk8L3htcDpDcmVhdG9yVG9vbD4KICAgICAgICAgPHhtcDpDcmVhdGVEYXRlPjIwMjItMDgtMTlUMTA6MzE6MjAtMDQ6MDA8L3htcDpDcmVhdGVEYXRlPgogICAgICAgICA8eG1wOk1vZGlmeURhdGU+MjAyMi0wOC0xOVQxNDozMToyMVo8L3htcDpNb2RpZnlEYXRlPgogICAgICAgICA8eG1wOk1ldGFkYXRhRGF0ZT4yMDIyLTA4LTE5VDEwOjMxOjIwLTA0OjAwPC94bXA6TWV0YWRhdGFEYXRlPgogICAgICAgICA8eG1wOlRodW1ibmFpbHM+CiAgICAgICAgICAgIDxyZGY6QWx0PgogICAgICAgICAgICAgICA8cmRmOmxpIHJkZjpwYXJzZVR5cGU9IlJlc291cmNlIj4KICAgICAgICAgICAgICAgICAgPHhtcEdJbWc6d2lkdGg+MjU2PC94bXBHSW1nOndpZHRoPgogICAgICAgICAgICAgICAgICA8eG1wR0ltZzpoZWlnaHQ+NDA8L3htcEdJbWc6aGVpZ2h0PgogICAgICAgICAgICAgICAgICA8eG1wR0ltZzpmb3JtYXQ+SlBFRzwveG1wR0ltZzpmb3JtYXQ+CiAgICAgICAgICAgICAgICAgIDx4bXBHSW1nOmltYWdlPi85ai80QUFRU2taSlJnQUJBZ0VBU0FCSUFBRC83UUFzVUdodmRHOXphRzl3SURNdU1BQTRRa2xOQSswQUFBQUFBQkFBU0FBQUFBRUEmI3hBO0FRQklBQUFBQVFBQi8rSUNRRWxEUTE5UVVrOUdTVXhGQUFFQkFBQUNNRUZFUWtVQ0VBQUFiVzUwY2xKSFFpQllXVm9nQjg4QUJnQUQmI3hBO0FBQUFBQUFBWVdOemNFRlFVRXdBQUFBQWJtOXVaUUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUGJXQUFFQUFBQUEweTFCUkVKRkFBQUEmI3hBO0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBS1kzQnlkQUFBQVB3QUFBQXkmI3hBO1pHVnpZd0FBQVRBQUFBQnJkM1J3ZEFBQUFad0FBQUFVWW10d2RBQUFBYkFBQUFBVWNsUlNRd0FBQWNRQUFBQU9aMVJTUXdBQUFkUUEmI3hBO0FBQU9ZbFJTUXdBQUFlUUFBQUFPY2xoWldnQUFBZlFBQUFBVVoxaFpXZ0FBQWdnQUFBQVVZbGhaV2dBQUFod0FBQUFVZEdWNGRBQUEmI3hBO0FBQkRiM0I1Y21sbmFIUWdNVGs1T1NCQlpHOWlaU0JUZVhOMFpXMXpJRWx1WTI5eWNHOXlZWFJsWkFBQUFHUmxjMk1BQUFBQUFBQUEmI3hBO0VVRmtiMkpsSUZKSFFpQW9NVGs1T0NrQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUEmI3hBO0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBRmhaV2lBQUFBQUFBQUR6VVFBQkFBQUEmI3hBO0FSYk1XRmxhSUFBQUFBQUFBQUFBQUFBQUFBQUFBQUJqZFhKMkFBQUFBQUFBQUFFQ013QUFZM1Z5ZGdBQUFBQUFBQUFCQWpNQUFHTjEmI3hBO2NuWUFBQUFBQUFBQUFRSXpBQUJZV1ZvZ0FBQUFBQUFBbkJnQUFFK2xBQUFFL0ZoWldpQUFBQUFBQUFBMGpRQUFvQ3dBQUErVldGbGEmI3hBO0lBQUFBQUFBQUNZeEFBQVFMd0FBdnB6LzdnQU9RV1J2WW1VQVpNQUFBQUFCLzlzQWhBQUdCQVFFQlFRR0JRVUdDUVlGQmdrTENBWUcmI3hBO0NBc01DZ29MQ2dvTUVBd01EQXdNREJBTURnOFFEdzRNRXhNVUZCTVRIQnNiR3h3Zkh4OGZIeDhmSHg4ZkFRY0hCdzBNRFJnUUVCZ2EmI3hBO0ZSRVZHaDhmSHg4Zkh4OGZIeDhmSHg4Zkh4OGZIeDhmSHg4Zkh4OGZIeDhmSHg4Zkh4OGZIeDhmSHg4Zkh4OGZIeDhmSHgvL3dBQVImI3hBO0NBQW9BUUFEQVJFQUFoRUJBeEVCLzhRQm9nQUFBQWNCQVFFQkFRQUFBQUFBQUFBQUJBVURBZ1lCQUFjSUNRb0xBUUFDQWdNQkFRRUImI3hBO0FRQUFBQUFBQUFBQkFBSURCQVVHQndnSkNnc1FBQUlCQXdNQ0JBSUdCd01FQWdZQ2N3RUNBeEVFQUFVaEVqRkJVUVlUWVNKeGdSUXkmI3hBO2thRUhGYkZDSThGUzBlRXpGbUx3SkhLQzhTVkRORk9Tb3JKamM4STFSQ2VUbzdNMkYxUmtkTVBTNGdnbWd3a0tHQm1FbEVWR3BMUlcmI3hBOzAxVW9HdkxqODhUVTVQUmxkWVdWcGJYRjFlWDFabmFHbHFhMnh0Ym05amRIVjJkM2g1ZW50OGZYNS9jNFNGaG9lSWlZcUxqSTJPajQmI3hBO0tUbEpXV2w1aVptcHVjblo2ZmtxT2twYWFucUttcXE2eXRycStoRUFBZ0lCQWdNRkJRUUZCZ1FJQXdOdEFRQUNFUU1FSVJJeFFRVlImI3hBO0UyRWlCbkdCa1RLaHNmQVV3ZEhoSTBJVlVtSnk4VE1rTkVPQ0ZwSlRKYUpqc3NJSGM5STE0a1NERjFTVENBa0tHQmttTmtVYUoyUjAmI3hBO1ZUZnlvN1BES0NuVDQvT0VsS1MweE5UazlHVjFoWldsdGNYVjVmVkdWbVoyaHBhbXRzYlc1dlpIVjJkM2g1ZW50OGZYNS9jNFNGaG8mI3hBO2VJaVlxTGpJMk9qNE9VbFphWG1KbWFtNXlkbnArU282U2xwcWVvcWFxcnJLMnVyNi85b0FEQU1CQUFJUkF4RUFQd0R1dC84QW1WcDAmI3hBO09wQ3lncksvcUdKdUVja29Wd09YQm5YNGVkQ1BnRlc2YmJqT1h4NnZ0YlZST2JUWVlSdzg0K0lhbE1lUXNiSDVmMG15VThFSmNNcEUmI3hBO3k4dW40L0FRTm4rWTZTdmV2RVlnc2NzVVRYZHc0RWFjbzdpU2hSRHlVbjZ2eFJXS2s4aDdWMlhaWFoycndDV1RWeUVzdVd2U1A0UU8mI3hBO1E3dXA1YmVaTnNaWm96K2dIZ0hYdlBYOGVhcTM1c1dSU0V4MnBMUEdyU0F5SUtNNUtweERNam40bFk4V1ZXSzBZTHZtMlFyd2ZtbFkmI3hBO1hIcUxiNmRkU3RDMGlURDkybERFQVdwemNlK0tFSjVvL05hUFR2TDdhcHAxdWpOSGVKYVNDNmtqUkFIaWtrQkxDUUtyZnU2Y1dZRVYmI3hBOzZkTVVnSk5QK2ZVRWx0WnRZYVZLMXhMUGFRM0VVaFUvNzFFcFJBR0RCdVNuajZpclZhTUJRNHJTTkg1NzZETmNRVzFucHQ1TlBkeGkmI3hBO1N6RENKQS9LZjZ1dGVUamlDZmkzN1lyU2pvZjUrNkpxVUVmKzQyNmFkSXJhUzhNWHBjRjlkQ1haUTBuSWhDcDI2OU1WcGtPa2ZtUGImI3hBO2E1cE5qcVdtMnpSeFhPcFE2ZklzNVJ0cFkxbDVJMEx1aElWd0R2OEFDM0pTS2pGYVpPbXI2VTdzaVhzRE9tenFKVUpHNVhjVjhSVEYmI3hBO0NxbDdaT1ZDWEViRnpSQXJxYWtlRkRpcWpOck9rUUtYbXZyZUpRR0paNVVVVVJnajdrL3NzYUh3T0txd3ZMTXY2WW5qTGdBbE9hMW8mI3hBOzJ5N1Y3MDJ4VlpCcWVtM0VTelc5M0RORTFlTWtjaXNwb2FHaEJJNjRxcXczRnZPdktHVkpWb0RWR0RDaDZIYkZWVEZVcjgwYXJOcEgmI3hBO2w3VU5UZ1JaSmJPQjVVUjY4U1ZGYUdsRGlxTkdvV0JubHR4Y3hHZURqNjhQTmVhY3hWZWExcXZJYml1S3R2ZTJjYWhwSjQwVXNFRE0mI3hBOzZnRmp1QnVlcHhWcE5Rc0hra2pTNWlhU0k4WlVEcVdVMXBSZ0RzYTRxNXRRc0ZweXVZbDVFS3RYVVZMR2lnYjl5ZHNWVndRUUNEVUgmI3hBO2NFZEtZcTdGWFlxN0ZYWXE3RlhZcTdGVWo4eWFqcTltT2RwNkVOdEhHMHIzRTVyemRkeEFpMUh4TUYvcFFqTkgydHJjK0EzSGdqakUmI3hBO1NlS1I1eUg4RVIzbXZqMDNEc2REZ3haTnBjUmtUVkRvUDV4OTM5cnlTMy9QTHp0Zi9tRCtoTERTN2FHeHQ1RDlmUzVjeWY2UEdVNVMmI3hBO1JQR0l5anV2MlEzT2hZVjZITW5WYWc2VFRuVlpwRWljSUdHT2dLbEtOMXhjejMrUXZZbW1HSEhEUEx3OGY4TXBBejMvQUlaR1BMbCsmI3hBO3ZiZGsray9tVHE0MVd5MDd6RkhieUxxczYyeVEycXVwUjJjUmdqa3hEUlY0RWhqeVBNOWw0blZkbjl1Zm04aGdZK2p2OTlVUDkxZnUmI3hBOzVtNmVqMVBZT0k0cFpOT1pEdzQ4VnlyY1ZmUWJTNTh0dlNPL2lZN1pma0Q1azFQVXZWODA2eERIWVFyUzJ0dE1aMlBJN212clJxcTEmI3hBO081MmF2dG5TNXpreXkzUEREb0E0ZWk3VTBlaHdpT0RIeDVqOVU4Z0h4cWlkdkxienNzcTBMOHBaL0xHaXlXT2g2bEpOUGZUSStwVFgmI3hBO0RDSVBIR2pxaW9FamxJQVpnU3RkL3dDWVlNZVBodmV5WEE3VjdXbHF6SDB4aEdBcUlqK1AxSnZGNWM4NVQ2UWtXbzZsQStxQ2QxYTUmI3hBO2g1SXYxT2VFUlNqWkIrOERWa1RicUZGYVpZNmxDMjNsMzh6bzdWMWZYTFlYQ2xCQndXa1JUMG5Fbk5mUzVjakp3SzBPd3I0QVlwWDImI3hBOzJpL21jamg1ZFZ0ZVRDSlhBY3NnNG1NeVNCUHE2L0UzRjl1VktNT2xOMURlbGFEK1kwR3BXZHplNnBheXhjaCtrVVFzRElpdDhQR3MmI3hBO1FGUWhwMi9qaXJONkN0ZStLdUFBclFkZHppcVZhOXBOeHFINk85QmtYNm5mUTNjdk1rVlNQbHlDMEIrTDRzVllPdmtuVWJpN211SnYmI3hBO0x0aWkzSkptSnVMZ082eXlVbEJDemNWWXI4VmY5ckZLRXUvSlBuQzFrc3A5SDBiVFZraXVaSmJzU1R6RXVzUWlOczZrdWFFbjFWZGEmI3hBOzBwVEZWWHl2NVE4eTJ6M0Z6ZStYdE1nZDJLeEtKSnBXZFh1VVA3eFdsWkFrYVZjQ2hKQUEyT0txVno1UjgwNmJjYWRmYVY1Y3NibSsmI3hBO2h1blJuZTRsS3BHVEUwVnhScGwzVWgrUUhzYUhGVUZxSGtyejdkVHl5RHk1cE1jU2hFZ3QxdVowVmxTTWdjK0VpVWF0QVdIaDdraFYmI3hBO2tPZzZSNS8wVnJaYkhTOU5oZ3VaV2ZWVTlhVWtBemdEZ1daejhFSkpYeE5hZ2RDcXFMY2ZuZEZjU2Y2Sm84OFBJaE9Vc2dQWHdWVm8mI3hBO3Y4dTVJSFVFOUZka1k5bCtZR3Q2QnEybWE1YjZkYXlYZHFZN1JyZDVTb2tZc0NKQ2VaSXBUY0wvQUVDcUc4d2VTYmpVZk1sM2ZIU3ImI3hBO1M0dDUwQkZ4Sk5Pa3BkWVBTRlVXUUp2OW5vS0RmcnZpckdOVzhrK2VRMXg5VzBTd20wejZzQ2xrYmlVemZXUFFDL0F6Uzdxa25MaXAmI3hBO2FocmlySzlDOGovWDdZeStidEx0RXZvWkN0cWxwTmN1Z2pCRDhnelNiY24zNGhRQWFudmlxYnIrWHZrOVlVZ1hUZ0lvNjhGOVdidi8mI3hBO0FMUGY2Y1VKOWEyME5yYlJXMEM4SUlFV09KS2swUkJ4VVZOVDBIZkZWVEZYWXE3RlhZcTdGWFlxN0ZXSWViN1R6RGNhdGJ0cDJtdmUmI3hBO3d4Ukt3bUYybHFzY2hkcThReVNIbFFBMUh0bXExL1ltSFZ6amtuUEpHVU9YQ2VYVytSMzgvSU9YcDlaTEZFeEFpYjcyTTIva1BVV3UmI3hBO2J6V0p0SHU0dFNWdldTelhVWURGZlNDS1VoYm1RUjgxWDFaU0JSdXRHN1ptNm5RWXRSaGhpems1ZURhTXBmVUkrbmE0OE4vU055T0wmI3hBO242dHk0bWwvd2ZMUEpoOUhpYnlpUHBNdC9WUnVqdnlCNGVYcDJDYjZiYmVhOU1tZG92TE1UeEdkcG8ya3ZJWlhpLzNwalV4MGlEN3gmI3hBO2VrTjIyOVJ2QnExYURzblQ2WGk4TW4xRzl3TnZqejZubVQ5cHZOMUd2eVpSdnR0VzE3OGp1THJtTC9zRFBzelhDZGlyc1ZkaXJzVmQmI3hBO2lyc1ZkaXJzVmRpcnNWZGlyc1ZkaXJzVmRpcnNWZGlyc1ZkaXJzVmRpcnNWZGlyc1ZkaXJzVmRpcnNWZGlyc1ZkaXJzVmRpcnNWZGkmI3hBO3JzVmRpcnNWZGlyc1ZkaXJzVmRpcnNWZGlyc1ZkaXJzVmRpcnNWZGlyc1ZkaXJzVmRpcnNWZGlyc1ZkaXJzVmRpcnNWZGlyejZQejkmI3hBOzVsMWFWUm9tanppQVBRM2MxdktZR1dwR3pQNlBMcHVVSnA5SU9ZZUFadU1tY28xWEtNVFYvd0JZbmZ1MkF2bTV1bzBjc1VBWmNObnAmI3hBO3hBeStNUnkrSi9TdWJ6RitZL292Q2RNQzNKVmxTY1dqTkdHNE54WTB1S2tjK08xUHMxM3JtWTRhSjArNS9OUy9zdlhVYWJZdWEvdWImI3hBO3kzdUZrREFyVFpKbUhFclgzeFZGeTZ4NTAwMm92ckNEVTVITWF4bXhXZU9NY3ZVNUUvQmN0WDRVcldnRmV1S29hUHoxNWljbFI1WXUmI3hBO1ZkUlZ1ZjFsVjNZZ2NXK3EwTzI1OE1WWGFmNS8xRzV1RlNieTVxRUVERVZtK3IzVlFyYkE4WkxlTGV0S2p0MXhXa2JMNXR1cDRVbDAmI3hBOy9Tci9BSng4NUpvTHExbWc1SXNVaENoaWpmRVpBblFFNHFvd2ViL01GeGZpeWo4dXpLOVRXYVpwb29hQmVYOTYxdnc4QjE2MStsUXkmI3hBO0RUcDlTbWpjMzlxbHBJR29pUnplc0dXZytJbmhIVGZ0VEZVWGlyc1ZkaXJzVmRpcnNWZGlyc1ZhZDFSR2RqUlZCTEh3QXhWNTVkZWYmI3hBO3ZNNlhSZTN0N0tXd2dqVm5GU0piaVVyNmpvbFpWRUFRZkJ5WVB5Tyt3Mk90bFBXUmpqL2RpY3BBY2RFUjROOXh2SThXMWN1VmRlS28mI3hBOzUrbGhwcHptTWhsQ0FOUlBPeFE5UkFqME4rblludkhYb2FPcm9ycWFxd0JVK0lPYkp3RzhWZGlyc1ZkaXJzVmRpcnNWZGlyc1ZkaXImI3hBO3NWZGlyLy9aPC94bXBHSW1nOmltYWdlPgogICAgICAgICAgICAgICA8L3JkZjpsaT4KICAgICAgICAgICAgPC9yZGY6QWx0PgogICAgICAgICA8L3htcDpUaHVtYm5haWxzPgogICAgICAgICA8eG1wTU06UmVuZGl0aW9uQ2xhc3M+cHJvb2Y6cGRmPC94bXBNTTpSZW5kaXRpb25DbGFzcz4KICAgICAgICAgPHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD51dWlkOjY1RTYzOTA2ODZDRjExREJBNkUyRDg4N0NFQUNCNDA3PC94bXBNTTpPcmlnaW5hbERvY3VtZW50SUQ+CiAgICAgICAgIDx4bXBNTTpEb2N1bWVudElEPnhtcC5kaWQ6MzA2ZDc1NjUtN2ZmMC00ZDRhLTg3NDUtMjQ0NzRhYTdhYjFhPC94bXBNTTpEb2N1bWVudElEPgogICAgICAgICA8eG1wTU06SW5zdGFuY2VJRD54bXAuaWlkOjMwNmQ3NTY1LTdmZjAtNGQ0YS04NzQ1LTI0NDc0YWE3YWIxYTwveG1wTU06SW5zdGFuY2VJRD4KICAgICAgICAgPHhtcE1NOkRlcml2ZWRGcm9tIHJkZjpwYXJzZVR5cGU9IlJlc291cmNlIj4KICAgICAgICAgICAgPHN0UmVmOmluc3RhbmNlSUQ+eG1wLmlpZDpmZDkyOGNkOS04Mjg5LWZlNGMtYTQ1NC0wOGEwYjQ1OGMzZjI8L3N0UmVmOmluc3RhbmNlSUQ+CiAgICAgICAgICAgIDxzdFJlZjpkb2N1bWVudElEPnhtcC5kaWQ6ZmQ5MjhjZDktODI4OS1mZTRjLWE0NTQtMDhhMGI0NThjM2YyPC9zdFJlZjpkb2N1bWVudElEPgogICAgICAgICAgICA8c3RSZWY6b3JpZ2luYWxEb2N1bWVudElEPnV1aWQ6NjVFNjM5MDY4NkNGMTFEQkE2RTJEODg3Q0VBQ0I0MDc8L3N0UmVmOm9yaWdpbmFsRG9jdW1lbnRJRD4KICAgICAgICAgICAgPHN0UmVmOnJlbmRpdGlvbkNsYXNzPnByb29mOnBkZjwvc3RSZWY6cmVuZGl0aW9uQ2xhc3M+CiAgICAgICAgIDwveG1wTU06RGVyaXZlZEZyb20+CiAgICAgICAgIDx4bXBNTTpIaXN0b3J5PgogICAgICAgICAgICA8cmRmOlNlcT4KICAgICAgICAgICAgICAgPHJkZjpsaSByZGY6cGFyc2VUeXBlPSJSZXNvdXJjZSI+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDphY3Rpb24+c2F2ZWQ8L3N0RXZ0OmFjdGlvbj4KICAgICAgICAgICAgICAgICAgPHN0RXZ0Omluc3RhbmNlSUQ+eG1wLmlpZDpmY2U3NTJjMC1lMmZhLTQwNDMtYTBkYS0zMjBjZjRkOGFmMDQ8L3N0RXZ0Omluc3RhbmNlSUQ+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDp3aGVuPjIwMjItMDQtMDhUMjM6NDI6NTQtMDQ6MDA8L3N0RXZ0OndoZW4+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDpzb2Z0d2FyZUFnZW50PkFkb2JlIElsbHVzdHJhdG9yIENDIDIzLjAgKFdpbmRvd3MpPC9zdEV2dDpzb2Z0d2FyZUFnZW50PgogICAgICAgICAgICAgICAgICA8c3RFdnQ6Y2hhbmdlZD4vPC9zdEV2dDpjaGFuZ2VkPgogICAgICAgICAgICAgICA8L3JkZjpsaT4KICAgICAgICAgICAgICAgPHJkZjpsaSByZGY6cGFyc2VUeXBlPSJSZXNvdXJjZSI+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDphY3Rpb24+c2F2ZWQ8L3N0RXZ0OmFjdGlvbj4KICAgICAgICAgICAgICAgICAgPHN0RXZ0Omluc3RhbmNlSUQ+eG1wLmlpZDozMDZkNzU2NS03ZmYwLTRkNGEtODc0NS0yNDQ3NGFhN2FiMWE8L3N0RXZ0Omluc3RhbmNlSUQ+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDp3aGVuPjIwMjItMDgtMTlUMTA6MzE6MjAtMDQ6MDA8L3N0RXZ0OndoZW4+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDpzb2Z0d2FyZUFnZW50PkFkb2JlIElsbHVzdHJhdG9yIENDIDIzLjAgKFdpbmRvd3MpPC9zdEV2dDpzb2Z0d2FyZUFnZW50PgogICAgICAgICAgICAgICAgICA8c3RFdnQ6Y2hhbmdlZD4vPC9zdEV2dDpjaGFuZ2VkPgogICAgICAgICAgICAgICA8L3JkZjpsaT4KICAgICAgICAgICAgPC9yZGY6U2VxPgogICAgICAgICA8L3htcE1NOkhpc3Rvcnk+CiAgICAgICAgIDx4bXBNTTpNYW5pZmVzdD4KICAgICAgICAgICAgPHJkZjpTZXE+CiAgICAgICAgICAgICAgIDxyZGY6bGkgcmRmOnBhcnNlVHlwZT0iUmVzb3VyY2UiPgogICAgICAgICAgICAgICAgICA8c3RNZnM6bGlua0Zvcm0+RW1iZWRCeVJlZmVyZW5jZTwvc3RNZnM6bGlua0Zvcm0+CiAgICAgICAgICAgICAgICAgIDxzdE1mczpyZWZlcmVuY2UgcmRmOnBhcnNlVHlwZT0iUmVzb3VyY2UiPgogICAgICAgICAgICAgICAgICAgICA8c3RSZWY6ZmlsZVBhdGg+QzpcVXNlcnNcR29uemFsbyBSLiBNZW5lc2VzIEFcRGVza3RvcFxCYW5tdWplclxlemdpZi01LTg0NjcwMDU2NzMtZ2lmLXBuZ1xmcmFtZV80M19kZWxheS0wLjFzLnBuZzwvc3RSZWY6ZmlsZVBhdGg+CiAgICAgICAgICAgICAgICAgICAgIDxzdFJlZjpkb2N1bWVudElEPnhtcC5kaWQ6NjIyNWJkYWMtZDdiNy1kODRiLThmYjMtYjM1ZTZlYThjYzYyPC9zdFJlZjpkb2N1bWVudElEPgogICAgICAgICAgICAgICAgICAgICA8c3RSZWY6aW5zdGFuY2VJRD54bXAuaWlkOmVkNmQxZTEzLTA3MjktYzI0OC1iNWQ3LWRkMDg4MTU4OWE1NTwvc3RSZWY6aW5zdGFuY2VJRD4KICAgICAgICAgICAgICAgICAgPC9zdE1mczpyZWZlcmVuY2U+CiAgICAgICAgICAgICAgIDwvcmRmOmxpPgogICAgICAgICAgICAgICA8cmRmOmxpIHJkZjpwYXJzZVR5cGU9IlJlc291cmNlIj4KICAgICAgICAgICAgICAgICAgPHN0TWZzOmxpbmtGb3JtPkVtYmVkQnlSZWZlcmVuY2U8L3N0TWZzOmxpbmtGb3JtPgogICAgICAgICAgICAgICAgICA8c3RNZnM6cmVmZXJlbmNlIHJkZjpwYXJzZVR5cGU9IlJlc291cmNlIj4KICAgICAgICAgICAgICAgICAgICAgPHN0UmVmOmZpbGVQYXRoPkM6XFVzZXJzXEdvbnphbG8gUi4gTWVuZXNlcyBBXERlc2t0b3BcQmFubXVqZXJcZXpnaWYtNS04NDY3MDA1NjczLWdpZi1wbmdcZnJhbWVfNDNfZGVsYXktMC4xcy5wbmc8L3N0UmVmOmZpbGVQYXRoPgogICAgICAgICAgICAgICAgICAgICA8c3RSZWY6ZG9jdW1lbnRJRD54bXAuZGlkOjYyMjViZGFjLWQ3YjctZDg0Yi04ZmIzLWIzNWU2ZWE4Y2M2Mjwvc3RSZWY6ZG9jdW1lbnRJRD4KICAgICAgICAgICAgICAgICAgICAgPHN0UmVmOmluc3RhbmNlSUQ+eG1wLmlpZDplZDZkMWUxMy0wNzI5LWMyNDgtYjVkNy1kZDA4ODE1ODlhNTU8L3N0UmVmOmluc3RhbmNlSUQ+CiAgICAgICAgICAgICAgICAgIDwvc3RNZnM6cmVmZXJlbmNlPgogICAgICAgICAgICAgICA8L3JkZjpsaT4KICAgICAgICAgICAgICAgPHJkZjpsaSByZGY6cGFyc2VUeXBlPSJSZXNvdXJjZSI+CiAgICAgICAgICAgICAgICAgIDxzdE1mczpsaW5rRm9ybT5FbWJlZEJ5UmVmZXJlbmNlPC9zdE1mczpsaW5rRm9ybT4KICAgICAgICAgICAgICAgICAgPHN0TWZzOnJlZmVyZW5jZSByZGY6cGFyc2VUeXBlPSJSZXNvdXJjZSI+CiAgICAgICAgICAgICAgICAgICAgIDxzdFJlZjpmaWxlUGF0aD5DOlxVc2Vyc1xHb256YWxvIFIuIE1lbmVzZXMgQVxEZXNrdG9wXEJhbm11amVyXGV6Z2lmLTUtODQ2NzAwNTY3My1naWYtcG5nXGZyYW1lXzQzX2RlbGF5LTAuMXMucG5nPC9zdFJlZjpmaWxlUGF0aD4KICAgICAgICAgICAgICAgICAgICAgPHN0UmVmOmRvY3VtZW50SUQ+eG1wLmRpZDo2MjI1YmRhYy1kN2I3LWQ4NGItOGZiMy1iMzVlNmVhOGNjNjI8L3N0UmVmOmRvY3VtZW50SUQ+CiAgICAgICAgICAgICAgICAgICAgIDxzdFJlZjppbnN0YW5jZUlEPnhtcC5paWQ6ZWQ2ZDFlMTMtMDcyOS1jMjQ4LWI1ZDctZGQwODgxNTg5YTU1PC9zdFJlZjppbnN0YW5jZUlEPgogICAgICAgICAgICAgICAgICA8L3N0TWZzOnJlZmVyZW5jZT4KICAgICAgICAgICAgICAgPC9yZGY6bGk+CiAgICAgICAgICAgIDwvcmRmOlNlcT4KICAgICAgICAgPC94bXBNTTpNYW5pZmVzdD4KICAgICAgICAgPHhtcE1NOkluZ3JlZGllbnRzPgogICAgICAgICAgICA8cmRmOkJhZz4KICAgICAgICAgICAgICAgPHJkZjpsaSByZGY6cGFyc2VUeXBlPSJSZXNvdXJjZSI+CiAgICAgICAgICAgICAgICAgIDxzdFJlZjpmaWxlUGF0aD5DOlxVc2Vyc1xHb256YWxvIFIuIE1lbmVzZXMgQVxEZXNrdG9wXEJhbm11amVyXGV6Z2lmLTUtODQ2NzAwNTY3My1naWYtcG5nXGZyYW1lXzQzX2RlbGF5LTAuMXMucG5nPC9zdFJlZjpmaWxlUGF0aD4KICAgICAgICAgICAgICAgICAgPHN0UmVmOmRvY3VtZW50SUQ+eG1wLmRpZDo2MjI1YmRhYy1kN2I3LWQ4NGItOGZiMy1iMzVlNmVhOGNjNjI8L3N0UmVmOmRvY3VtZW50SUQ+CiAgICAgICAgICAgICAgICAgIDxzdFJlZjppbnN0YW5jZUlEPnhtcC5paWQ6ZWQ2ZDFlMTMtMDcyOS1jMjQ4LWI1ZDctZGQwODgxNTg5YTU1PC9zdFJlZjppbnN0YW5jZUlEPgogICAgICAgICAgICAgICA8L3JkZjpsaT4KICAgICAgICAgICAgICAgPHJkZjpsaSByZGY6cGFyc2VUeXBlPSJSZXNvdXJjZSI+CiAgICAgICAgICAgICAgICAgIDxzdFJlZjpmaWxlUGF0aD5DOlxVc2Vyc1xHb256YWxvIFIuIE1lbmVzZXMgQVxEZXNrdG9wXEJhbm11amVyXGV6Z2lmLTUtODQ2NzAwNTY3My1naWYtcG5nXGZyYW1lXzQzX2RlbGF5LTAuMXMucG5nPC9zdFJlZjpmaWxlUGF0aD4KICAgICAgICAgICAgICAgICAgPHN0UmVmOmRvY3VtZW50SUQ+eG1wLmRpZDo2MjI1YmRhYy1kN2I3LWQ4NGItOGZiMy1iMzVlNmVhOGNjNjI8L3N0UmVmOmRvY3VtZW50SUQ+CiAgICAgICAgICAgICAgICAgIDxzdFJlZjppbnN0YW5jZUlEPnhtcC5paWQ6ZWQ2ZDFlMTMtMDcyOS1jMjQ4LWI1ZDctZGQwODgxNTg5YTU1PC9zdFJlZjppbnN0YW5jZUlEPgogICAgICAgICAgICAgICA8L3JkZjpsaT4KICAgICAgICAgICAgICAgPHJkZjpsaSByZGY6cGFyc2VUeXBlPSJSZXNvdXJjZSI+CiAgICAgICAgICAgICAgICAgIDxzdFJlZjpmaWxlUGF0aD5DOlxVc2Vyc1xHb256YWxvIFIuIE1lbmVzZXMgQVxEZXNrdG9wXEJhbm11amVyXGV6Z2lmLTUtODQ2NzAwNTY3My1naWYtcG5nXGZyYW1lXzQzX2RlbGF5LTAuMXMucG5nPC9zdFJlZjpmaWxlUGF0aD4KICAgICAgICAgICAgICAgICAgPHN0UmVmOmRvY3VtZW50SUQ+eG1wLmRpZDo2MjI1YmRhYy1kN2I3LWQ4NGItOGZiMy1iMzVlNmVhOGNjNjI8L3N0UmVmOmRvY3VtZW50SUQ+CiAgICAgICAgICAgICAgICAgIDxzdFJlZjppbnN0YW5jZUlEPnhtcC5paWQ6ZWQ2ZDFlMTMtMDcyOS1jMjQ4LWI1ZDctZGQwODgxNTg5YTU1PC9zdFJlZjppbnN0YW5jZUlEPgogICAgICAgICAgICAgICA8L3JkZjpsaT4KICAgICAgICAgICAgPC9yZGY6QmFnPgogICAgICAgICA8L3htcE1NOkluZ3JlZGllbnRzPgogICAgICAgICA8aWxsdXN0cmF0b3I6U3RhcnR1cFByb2ZpbGU+V2ViPC9pbGx1c3RyYXRvcjpTdGFydHVwUHJvZmlsZT4KICAgICAgICAgPHBkZjpQcm9kdWNlcj5BZG9iZSBQREYgbGlicmFyeSAxNS4wMDwvcGRmOlByb2R1Y2VyPgogICAgICAgICA8cGRmeDpDcmVhdG9yVmVyc2lvbj4yMS4wLjA8L3BkZng6Q3JlYXRvclZlcnNpb24+CiAgICAgIDwvcmRmOkRlc2NyaXB0aW9uPgogICA8L3JkZjpSREY+CjwveDp4bXBtZXRhPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg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';

		return $image;
	}
}
