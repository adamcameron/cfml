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
		$app["controller.twigInclude"] = $app->share(function() {
			return new controller\TwigInclude();
		});
		$app["controller.subRequest"] = $app->share(function() {
			return new controller\SubRequest();
		});
		$app["controller.deep"] = $app->share(function() {
			return new controller\Deep();
		});
	}

}
