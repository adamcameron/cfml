<?php
// ControllerProviders.php
namespace me\adamcameron\twig\provider\service;

use Silex;
use me\adamcameron\twig\provider\controller;

class ControllerProviders extends Base {

	public function register(Silex\Application $app) {
		$app["provider.controller.home"] = $app->share(function() {
			return new controller\Home();
		});
		$app["provider.controller.subhome"] = $app->share(function() {
			return new controller\SubHome();
		});
	}

}
