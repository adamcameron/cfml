<?php
// Dependencies.php

namespace app;

use \dac\guzzledemo\controllers;
use \dac\guzzledemo\services;
use \dac\guzzledemo\beans;
use GuzzleHttp\Client;

class Dependencies {

	static function configure($app){

		$app["controllers.hello"] = $app->share(function() {
			return new controllers\Hello();
		});		
		$app["controllers.article"] = $app->share(function($app) {
			return new controllers\Article(
				$app["twig"],
				$app["services.article"],
				$app["services.reference"],
				$app["services.comment"],
				$app["services.logger"]
			);
		});		
		$app["controllers.links"] = $app->share(function($app) {
			return new controllers\Links(
				$app["twig"]
			);
		});		


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