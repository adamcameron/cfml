<?php
// SubRequest.php

namespace me\adamcameron\twig\provider\controller;

use Silex;
use Silex\ControllerProviderInterface;

class SubRequest implements ControllerProviderInterface {

	public function connect(Silex\Application $app){
		$controllers = $app['controllers_factory'];

		$controllers->match('main/', 'controller.subRequest:doMain')
			->method('GET')
			->bind('route.subRequestMain');

		$controllers->get('sub/', 'controller.subRequest:doSub')
			->method('GET')
			->bind('route.subRequestSub');

		return $controllers;
	}

}
