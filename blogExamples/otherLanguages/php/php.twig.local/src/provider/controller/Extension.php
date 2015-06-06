<?php
// Extension.php

namespace me\adamcameron\twig\provider\controller;

use Silex;
use Silex\ControllerProviderInterface;

class Extension implements ControllerProviderInterface {

	public function connect(Silex\Application $app){
		$controllers = $app['controllers_factory'];

		$controllers->match('dump', 'controller.extension:doDump')
			->method('GET')
			->bind('route.extension.dump');

		return $controllers;
	}

}
