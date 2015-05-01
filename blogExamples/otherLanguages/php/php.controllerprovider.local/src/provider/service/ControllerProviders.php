<?php
// ControllerProviders.php
namespace me\adamcameron\controllerprovider\provider\service;

use Silex;
use me\adamcameron\controllerprovider\provider\controller;

class ControllerProviders extends Base {

	public function register(Silex\Application $app) {
		$app["provider.controller.home"] = $app->share(function() {
			return new controller\Home();
		});
		$app["provider.controller.user"] = $app->share(function() {
			return new controller\User();
		});
	}

}
