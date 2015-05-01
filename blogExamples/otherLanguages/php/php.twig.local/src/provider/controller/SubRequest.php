<?php
// SubRequest.php

namespace me\adamcameron\twig\provider\controller;

use Silex;
use Silex\ControllerProviderInterface;

class SubRequest implements ControllerProviderInterface {

	public function connect(Silex\Application $app){
		$controllers = $app['controllers_factory'];

		$controllers->match('', 'controller.subrequest:doList')
			->method('GET')
			->bind('route.subrequest.dolist');

		return $controllers;
	}

}
