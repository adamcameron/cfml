<?php
// TwigInclude.php

namespace me\adamcameron\twig\provider\controller;

use Silex;
use Silex\ControllerProviderInterface;

class TwigInclude implements ControllerProviderInterface {

	public function connect(Silex\Application $app){
		$controllers = $app['controllers_factory'];

		$controllers->match('', 'controller.twigInclude:doGet')
			->method('GET')
			->bind('route.twigInclude');

		return $controllers;
	}

}
