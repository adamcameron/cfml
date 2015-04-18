<?php
// Factories.php
namespace me\adamcameron\asyncguzzle\provider\service;

class Factories extends Base {

	public function register(Application $app) {

		$app["factories.article"] = $app->protect(function($id, $date, $title, $body) {
			return new beans\Article($id, $date, $title, $body);
		});

		$app["factories.reference"] = $app->protect(function($id, $articleId, $title, $link) {
			return new beans\Reference($id, $articleId, $title, $link);
		});

		$app["factories.comment"] = $app->protect(function($id, $articleId, $date, $author, $body) {
			return new beans\Comment($id, $articleId, $date, $author, $body);
		});


		$app["services.guzzle.client"] = $app->share(function() {
			return new Client();
		});
	}

}
