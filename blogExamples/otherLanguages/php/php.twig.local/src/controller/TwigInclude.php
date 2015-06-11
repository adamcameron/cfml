<?php
// TwigInclude.php
namespace me\adamcameron\twig\controller;

use Silex\Application;
use Symfony\Component\HttpFoundation\Request;

class TwigInclude {

	public static function doGet(Request $request, Application $app){
		$viewData = [
			'messageForMain' => 'This will be output in the main twig',
			'messageForInclude' => 'This will be output in the included twig'
		];
		return $app['twig']->render('include/main.html.twig', $viewData);
	}

	public static function testVariableSetWithin(Request $request, Application $app){
		return $app['twig']->render('include/includeWithVarUnset.html.twig');
	}

	public static function testVariableSetBefore(Request $request, Application $app){
		return $app['twig']->render('include/includeWithVarSet.html.twig');
	}

}
