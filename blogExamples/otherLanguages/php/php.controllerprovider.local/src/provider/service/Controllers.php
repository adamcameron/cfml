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
	}

}
