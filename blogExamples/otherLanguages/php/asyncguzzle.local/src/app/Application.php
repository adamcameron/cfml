<?php
// Application.php
namespace me\adamcameron\asyncguzzle\app;

use Silex;
use me\adamcameron\asyncguzzle\provider;

use Silex\Application as SilexApplication;

class Application extends SilexApplication {

	function __construct(){
		parent::__construct();

		$this['debug'] = true;
		$this->registerProviders();
		$this->mountControllers();

	}

	function registerProviders(){
		$this->register(new Silex\Provider\TwigServiceProvider(), [
			"twig.path" => __DIR__ . '/views'
		]);
		//$this->register(new provider\service\Services());
		//$this->register(new provider\service\Factories());
		$this->register(new provider\service\Controllers());
	}

	function mountControllers(){
		$this->mount('/hello', new provider\controller\Hello());
	}

}