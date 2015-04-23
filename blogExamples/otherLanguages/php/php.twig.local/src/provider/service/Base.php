<?php
// Base.php
namespace me\adamcameron\twig\provider\service;

use Silex\ServiceProviderInterface;
use Silex;

abstract class Base implements ServiceProviderInterface {

	public function register(Silex\Application $app){
		parent::register($app);
	}

	public function boot(Silex\Application $app){
		// nop
	}

}
