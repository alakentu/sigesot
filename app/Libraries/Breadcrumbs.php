<?php

/**
 * Breadcrumbs Library
 *
 * @package		Octopus Framework
 * @copyright  	(C) 2021 Gonzalo R. Meneses. <alakentu2003@hotmail.com>
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace App\Libraries;

class Breadcrumbs
{
	protected $uri;

	private $breadcrumbs = [];

	private $tags = [];

	public $clickable;

	public function __construct()
	{
		$this->uri = service('uri');

		// La última ruta de navegación debe ser un enlace en el que se pueda hacer clic?
		// Si es así, entonces debe ser establecido en verdadero (true)
		$this->clickable = false;

		// Create our bootstrap html elements
		$this->tags['nav_open']  		= '<div class="page-title-right">';
		$this->tags['nav_close'] 		= '</div>';
		$this->tags['ol_open']   		= '<ol class="breadcrumb m-0">';
		$this->tags['ol_close']  		= '</ol>';
		$this->tags['li_open']   		= '<li class="breadcrumb-item">';
		$this->tags['li_active_open']	= '<li class="breadcrumb-item active" aria-current="page">';
		$this->tags['li_close']  		= '</li>';
	}

	public function add($crumb, $href)
	{
		// If the title or Href not set return
		if (!$crumb || !$href) {
			return;
		}

		$this->breadcrumbs[] = array(
			'crumb' => $crumb,
			'href' => $href,
		);
	}

	public function render()
	{
		//$output = $this->tags['nav_open'];
		$output = $this->tags['ol_open'];

		$count = count($this->breadcrumbs) - 1;

		foreach ($this->breadcrumbs as $index => $breadcrumb) {

			if ($index == $count) {
				$output .= $this->tags['li_open'];
				$output .= $breadcrumb['crumb'];
				$output .= $this->tags['li_close'];
			} else {
				$output .= $this->tags['li_active_open'];
				$output .= '<a href="' . site_url($breadcrumb['href']) . '">';
				$output .= $breadcrumb['crumb'];
				$output .= '</a>';
				$output .= $this->tags['li_close'];
			}
		}

		$output .= $this->tags['ol_close'];
		//$output .= $this->tags['nav_close'];

		return $output;
	}

	public function build()
	{
		$segments 	= $this->uri->getSegments();
		$crumbs 	= array_filter($segments);
		$result 	= [];
		$path 		= '';

		// Resta 1 del conteo si este no debe ser un enalce clicable
		$count = count($crumbs);

		if ($this->clickable == false) {
			$count = count($crumbs) - 1;
		}

		$output = $this->tags['nav_open'];
		$output .= $this->tags['ol_open'];

		foreach ($crumbs as $key => $crumb) {
			$path .= '/' . $crumb;

			$name = ucwords(str_replace(array(".php", "_"), array("", " "), $crumb));
			$name = ucwords(str_replace('-', ' ', $name));
			$name = lang('Breadcrumb.Item' . str_replace(' ', '_', $name));



			if ($key != $count) {
				$result[] = $this->tags['li_open'] . '<a href="' . base_url($path) . '"> ' . $name . '</a>' . $this->tags['li_close'];
			} else {
				if (is_numeric($crumb)) {
					$result[] = '';
				} else {
					$result[] = $this->tags['li_active_open'] .  $name . $this->tags['li_close'];
				}
			}
		}

		$output .= implode($result);
		$output .= $this->tags['ol_close'];
		$output .= $this->tags['nav_close'];

		return $output;
	}
}
