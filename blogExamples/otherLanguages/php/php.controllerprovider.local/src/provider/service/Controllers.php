<?php
// Controllers.php
namespace me\adamcameron\controllerprovider\provider\service;

use Silex;
use me\adamcameron\controllerprovider\controller;

class Controllers extends Base {

	public function register(Silex\Application $app) {
		$app["controller.home"] = $app->share(function() {
			return new controller\Home();
		});
		$app["controller.user.create"] = $app->share(function() {
			return new controller\user\Create();
		});
		$app["controller.user.read"] = $app->share(function() {
			return new controller\user\Read();
		});
		$app["controller.user.update"] = $app->share(function() {
			return new controller\user\Update();
		});
		$app["controller.user.delete"] = $app->share(function() {
			return new controller\user\Delete();
		});
	}

}
