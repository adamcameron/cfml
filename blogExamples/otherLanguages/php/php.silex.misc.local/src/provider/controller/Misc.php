<?php
// Misc.php
namespace me\adamcameron\misc\provider\controller;

use Silex;
use Silex\ControllerProviderInterface;

class Misc implements ControllerProviderInterface {

	public function connect(Silex\Application $app){
		$controllers = $app['controllers_factory'];

		$controllers->get('/listRoutes', 'controller.misc:listRoutes')
			->method('GET')
			->bind('route.listRoutes');
		$controllers->get('/debugInfo', 'controller.misc:showDebugInfo')
			->method('GET')
			->bind('route.debugInfo');
		$controllers->get('/blank', 'controller.misc:doBlank')
			->method('GET')
			->bind('route.blank');
		return $controllers;
	}

}
