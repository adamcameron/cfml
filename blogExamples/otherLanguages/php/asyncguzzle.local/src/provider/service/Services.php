<?php
// Services.php
namespace me\adamcameron\asyncguzzle\provider\service;

use me\adamcameron\guzzleapp\service;
use me\adamcameron\guzzleapp\factory;

class Services extends Base {

	public function register(Application $app) {
		$app["services.article"] = $app->share(function($app) {
			return new services\Article(
				$app["factories.article"],
				$app["services.guzzle.client"],
				$app["services.logger"]
			);
		});		

		$app["services.reference"] = $app->share(function($app) {
			return new services\Reference(
				$app["factories.reference"],
				$app["services.guzzle.client"],
				$app["services.logger"]
			);
		});		

		$app["services.comment"] = $app->share(function($app) {
			return new services\Comment(
				$app["factories.comment"],
				$app["services.guzzle.client"],
				$app["services.logger"]
			);
		});		

		$app["services.logger"] = function() {
			return new services\Logger();
		};

		$app["services.guzzle.client"] = $app->share(function() {
			return new Client();
		});
	}

}
