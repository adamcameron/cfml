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
			->bind('route.twigInclude.default');
		$controllers->match('variableSetWithin', 'controller.twigInclude:testVariableSetWithin')
			->method('GET')
			->bind('route.twigInclude.variableSetWithin');
		$controllers->match('variableSetBefore', 'controller.twigInclude:testVariableSetBefore')
			->method('GET')
			->bind('route.twigInclude.variableSetBefore');

		return $controllers;
	}

}
