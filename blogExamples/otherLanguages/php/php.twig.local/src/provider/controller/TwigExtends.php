<?php
// TwigExtends.php

namespace me\adamcameron\twig\provider\controller;

use Silex;
use Silex\ControllerProviderInterface;

class TwigExtends implements ControllerProviderInterface {

	public function connect(Silex\Application $app){
		$controllers = $app['controllers_factory'];

		$controllers->match('master/', 'controller.twigExtends:doMaster')
			->method('GET')
			->bind('route.twigExtendsMaster');

		$controllers->get('detail/', 'controller.twigExtends:doDetail')
			->method('GET')
			->bind('route.twigExtendsDetail');

		return $controllers;
	}

}
