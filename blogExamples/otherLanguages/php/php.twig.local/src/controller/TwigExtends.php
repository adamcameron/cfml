<?php
// TwigExtends.php
namespace me\adamcameron\twig\controller;

use Silex\Application;
use Symfony\Component\HttpFoundation\Request;

class TwigExtends {

	public static function doMaster(Request $request, Application $app){
		$viewData = [
			'message' => 'This was set in the Master controller'
		];
		return $app['twig']->render('extends/master.html.twig', $viewData);
	}

	public static function doDetail(Request $request, Application $app){
		$viewData = [
			'message' => 'This was set in the Detail controller'
		];
		return $app['twig']->render('extends/detail.html.twig', $viewData);
	}

}
