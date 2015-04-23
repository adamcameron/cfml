<?php
// Controllers.php
namespace me\adamcameron\twig\provider\service;

use Silex;
use me\adamcameron\twig\controller;

class Controllers extends Base {

	public function register(Silex\Application $app) {
		$app["controller.home"] = $app->share(function() {
			return new controller\Home();
		});
		$app["controller.subhome"] = $app->share(function() {
			return new controller\SubHome();
		});
	}

}
