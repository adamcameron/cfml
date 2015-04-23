<?php
// Home.php
namespace me\adamcameron\twig\provider\controller;

use Silex;
use Silex\ControllerProviderInterface;

class SubHome implements ControllerProviderInterface {

	public function connect(Silex\Application $app){
		$controllers = $app['controllers_factory'];

		$controllers->get('', 'controller.subhome:doGet')
			->method('GET')
			->bind('route.subhome');
		return $controllers;
	}

}
