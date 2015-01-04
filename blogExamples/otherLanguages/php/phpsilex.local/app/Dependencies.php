<?php
// Dependencies.php

namespace app;
use \dac\silexdemo\controllers;
use \dac\silexdemo\services;
use \dac\silexdemo\beans;
use GuzzleHttp\Client;

class Dependencies {

	static function configure($app){

		$app["controllers.hello"] = $app->share(function() {
			return new controllers\Hello();
		});		
		$app["controllers.user"] = $app->share(function($app) {
			return new controllers\User($app["twig"], $app["services.user"]);
		});		


		$app["services.user"] = $app->share(function($app) {
			return new services\User($app["factories.user"], $app["services.guzzle.client"]);
		});		


		$app["factories.user"] = $app->protect(function($id, $firstName, $lastName) {
			return new beans\User($id, $firstName, $lastName);
		});


		$app["services.guzzle.client"] = function() {
			return new Client();
		};
	}

}