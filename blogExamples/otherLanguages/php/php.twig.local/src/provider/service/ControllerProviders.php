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
		$app["provider.controller.twigextends"] = $app->share(function() {
			return new controller\TwigExtends();
		});
		$app["provider.controller.twiginclude"] = $app->share(function() {
			return new controller\TwigInclude();
		});
	}

}
