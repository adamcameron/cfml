<?php
// ControllerProviders.php
namespace me\adamcameron\misc\provider\service;

use Silex;
use me\adamcameron\misc\provider\controller;

class ControllerProviders extends Base {

	public function register(Silex\Application $app) {
		$app["provider.controller.home"] = $app->share(function() {
			return new controller\Home();
		});
		$app["provider.controller.misc"] = $app->share(function() {
			return new controller\Misc();
		});
	}

}
