<?php
// Controllers.php
namespace me\adamcameron\misc\provider\service;

use Silex;
use me\adamcameron\misc\controller;

class Controllers extends Base {

	public function register(Silex\Application $app) {
		$app["controller.home"] = $app->share(function() {
			return new controller\Home();
		});
		$app["controller.misc"] = $app->share(function() {
			return new controller\Misc();
		});
		$app["controller.scripts"] = $app->share(function() {
			return new controller\Scripts();
		});
	}

}
