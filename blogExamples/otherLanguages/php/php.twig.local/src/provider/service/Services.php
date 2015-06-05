<?php
// Services.php
namespace me\adamcameron\twig\provider\service;

use Silex;
use me\adamcameron\twig\controller;

class Services extends Base {

	public function register(Silex\Application $app) {
        $app['twig'] = $app->share($app->extend('twig', function($twig) {
            $function = new \Twig_SimpleFunction('dBug', function ($obj) {
                new \dBug($obj);
            });
            $twig->addFunction($function);
            return $twig;
        }));
	}
}
