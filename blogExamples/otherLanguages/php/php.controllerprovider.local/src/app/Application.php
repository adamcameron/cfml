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
	}

	function mountControllers(){
		$this->mount('/', new provider\controller\Home());
		$this->mount('/user', new provider\controller\User());
	}

}