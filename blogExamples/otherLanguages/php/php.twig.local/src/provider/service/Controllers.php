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
		$app["controller.simple"] = $app->share(function() {
			return new controller\Simple();
		});
		$app["controller.twigExtends"] = $app->share(function() {
			return new controller\TwigExtends();
		});
		$app["controller.subhome"] = $app->share(function() {
			return new controller\SubHome();
		});
		$app["controller.master"] = $app->share(function() {
			return new controller\Master();
		});
		$app["controller.detail"] = $app->share(function() {
			return new controller\Detail();
		});
		$app["controller.submaster"] = $app->share(function() {
			return new controller\SubMaster();
		});
	}

}
