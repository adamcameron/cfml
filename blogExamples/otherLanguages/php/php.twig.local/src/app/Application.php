<?php
// Application.php
namespace me\adamcameron\twig\app;

use Silex;
use me\adamcameron\twig\provider;

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
		$this->register(new Silex\Provider\UrlGeneratorServiceProvider());
		$this->register(new provider\service\Controllers());
		$this->register(new provider\service\ControllerProviders());
	}

	function mountControllers(){
		$this->mount('/', $this["provider.controller.home"]);
		$this->mount('/subhome', $this["provider.controller.subhome"]);
	}

}