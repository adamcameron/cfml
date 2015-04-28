<?php
// Simple.php

namespace me\adamcameron\twig\provider\controller;

use Silex;
use Silex\ControllerProviderInterface;

class Simple implements ControllerProviderInterface {

	public function connect(Silex\Application $app){
		$controllers = $app['controllers_factory'];

		$controllers->match('', 'controller.simple:doGet')
			->method('GET')
			->bind('route.simple');

		return $controllers;
	}

}
