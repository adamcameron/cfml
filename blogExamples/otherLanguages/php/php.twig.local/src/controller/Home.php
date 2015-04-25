<?php
// Home.php
namespace me\adamcameron\twig\controller;

use Silex\Application;
use Symfony\Component\HttpFoundation\Request;

class Home {

	public static function doGet(Request $request, Application $app){
		$viewData = [
			'messageFromHome' => 'Set in the Home controller',
			'complexMessageFromHome' => ['a','b','c']
		];
		return $app['twig']->render('home.html.twig', $viewData);
	}

}
