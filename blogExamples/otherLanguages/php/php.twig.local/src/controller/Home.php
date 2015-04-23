<?php
// Home.php
namespace me\adamcameron\twig\controller;

use Silex\Application;
use Symfony\Component\HttpFoundation\Request;

class Home {

	public static function doGet(Request $request, Application $app){
		$viewData = ['messageFromHome'=>'this was set in the Home controller'];
		return $app['twig']->render('home.html.twig', $viewData);
	}

}