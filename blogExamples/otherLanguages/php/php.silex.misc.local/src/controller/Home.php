<?php
// Home.php
namespace me\adamcameron\misc\controller;

use Silex\Application;
use Symfony\Component\HttpFoundation\Request;

class Home {

	public static function doGet(Request $request, Application $app){
		return $app['twig']->render('home.html.twig', ['greeting' => 'G\'day world']);
	}

}
