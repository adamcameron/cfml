<?php
// Application.php
namespace me\adamcameron\controllerprovider\app;

use Silex;
use me\adamcameron\controllerprovider\provider;

use Silex\Application as SilexApplication;

class Application extends SilexApplication {

	function __construct(){
		parent::__construct();
		$this['debug'] = true;
		$this->registerProviders();
		$this->mountControllers();
	}

	function registerProviders(){
		$this->register(new Silex\Provider\ServiceControllerServiceProvider());
		$this->register(new Silex\Provider\TwigServiceProvider(), [
			"twig.path" => __DIR__ . '\..\views'
		]);
		$this->register(new provider\service\Controllers());
		$this->register(new provider\service\ControllerProviders());
	}

	function mountControllers(){
		$this->mount('/', $this["provider.controller.home"]);
		$this->mount('/user', $this["provider.controller.user"]);
	}

}