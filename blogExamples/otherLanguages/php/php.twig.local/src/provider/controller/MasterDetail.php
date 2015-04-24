<?php
// MasterDetail.php
namespace me\adamcameron\twig\provider\controller;

use Silex;
use Silex\ControllerProviderInterface;

class MasterDetail implements ControllerProviderInterface {

	public function connect(Silex\Application $app){
		$controllers = $app['controllers_factory'];

		$controllers->get('master/', 'controller.master:doGet')
			->method('GET')
			->bind('route.master');
		$controllers->get('detail/', 'controller.detail:doGet')
			->method('GET')
			->bind('route.detail');
		$controllers->get('submaster/', 'controller.submaster:doGet')
			->method('GET')
			->bind('route.submaster');

		return $controllers;
	}

}
