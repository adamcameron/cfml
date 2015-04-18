<?php
// Hello.php
namespace me\adamcameron\asyncguzzle\provider\controller;

use Silex;
use Silex\ControllerProviderInterface;

class Hello implements ControllerProviderInterface {

	public function connect(Silex\Application $app){
		$controllers = $app['controllers_factory'];

		$controllers->get('/{name}', '\me\adamcameron\asyncguzzle\controller\Hello::doGet')
			->method('GET')
			->bind('route.helloByName')
			->assert('name', '(?i)[a-z]+');
		return $controllers;
	}

}
