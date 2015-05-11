<?php
// Deep.php

namespace me\adamcameron\twig\provider\controller;

use Silex;
use Silex\ControllerProviderInterface;

class Deep implements ControllerProviderInterface {

	public function connect(Silex\Application $app){
		$controllers = $app['controllers_factory'];

		$controllers->match('doc/', 'controller.deep:doDefaultDoc')
			->method('GET')
			->bind('route.deep.default');

		$controllers->match('layout/', 'controller.deep:doDefaultLayout')
			->method('GET')
			->bind('route.deep.layout');

		$controllers->match('sample/', 'controller.deep:doSample')
			->method('GET')
			->bind('route.deep.sample');

		$controllers->match('actualSimple/', 'controller.deep:doActualSimple')
			->method('GET')
			->bind('route.deep.actualSimple');

        $controllers->match('actualComplex/', 'controller.deep:doActualComplex')
            ->method('GET')
            ->bind('route.deep.actualComplex');

		$controllers->match('userSummary/', 'controller.deep:doUserSummary')
			->method('GET')
			->bind('route.deep.userSummary');

		return $controllers;
	}

}
