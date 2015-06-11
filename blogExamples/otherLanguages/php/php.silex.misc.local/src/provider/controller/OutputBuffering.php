<?php
// OutputBuffering.php
namespace me\adamcameron\misc\provider\controller;

use Silex;
use Silex\ControllerProviderInterface;

class OutputBuffering implements ControllerProviderInterface {

	public function connect(Silex\Application $app){
		$controllers = $app['controllers_factory'];

		$controllers->get('/showBasic/', 'controller.outputBuffering:showBasic')
			->method('GET')
			->bind('route.outputBuffering.showBasic');
		return $controllers;
	}

}
