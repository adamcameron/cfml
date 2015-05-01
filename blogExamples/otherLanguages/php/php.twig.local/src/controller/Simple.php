<?php
// Simple.php
namespace me\adamcameron\twig\controller;

use Silex\Application;
use Symfony\Component\HttpFoundation\Request;

class Simple {

	public static function doGet(Request $request, Application $app){
		return $app['twig']->render('simple.html.twig', ['message'=>"G'day world"]);
	}

}
