<?php
// TwigExtends.php
namespace me\adamcameron\twig\controller;

use Silex\Application;
use Symfony\Component\HttpFoundation\Request;

class TwigExtends {

	public static function doList(Request $request, Application $app){
		$viewData = [
			'message' => 'This was set in the Master controller'
		];
		return $app['twig']->render('list.html.twig', $viewData);
	}

}
