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
		$app["provider.controller.simple"] = $app->share(function() {
			return new controller\Simple();
		});
		$app["provider.controller.twigExtends"] = $app->share(function() {
			return new controller\TwigExtends();
		});
		$app["provider.controller.twigInclude"] = $app->share(function() {
			return new controller\TwigInclude();
		});
		$app["provider.controller.subRequest"] = $app->share(function() {
			return new controller\SubRequest();
		});
		$app["provider.controller.deep"] = $app->share(function() {
			return new controller\Deep();
		});
		$app["provider.controller.extension"] = $app->share(function() {
			return new controller\Extension();
		});
	}

}
