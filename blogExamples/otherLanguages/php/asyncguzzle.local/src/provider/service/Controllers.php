<?php
// Controllers.php
namespace me\adamcameron\asyncguzzle\provider\service;

use Silex;
use me\adamcameron\asyncguzzle\controller;

class Controllers extends Base {

	public function register(Silex\Application $app) {

		$app["controller.hello"] = $app->share(function() {
			return new controller\Hello();
		});

		$app["controller.article"] = $app->share(function($app) {
			return new controller\Article(
				$app["twig"],
				$app["services.article"],
				$app["services.reference"],
				$app["services.comment"],
				$app["services.logger"]
			);
		});		
		
		$app["controller.links"] = $app->share(function($app) {
			return new controller\Links(
				$app["twig"]
			);
		});		
	}

}
