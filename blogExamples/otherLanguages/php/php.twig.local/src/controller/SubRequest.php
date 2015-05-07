<?php
// SubRequest.php
namespace me\adamcameron\twig\controller;

use Silex\Application;
use Symfony\Component\HttpFoundation\Request;

class SubRequest {

	public static function doMain(Request $request, Application $app){
		$viewData = ['mainMessage'=>'This was set in the doMain() method'];
		return $app['twig']->render('subrequest/main.html.twig', $viewData);
	}
	public static function doSub(Request $request, Application $app){
		$viewData = [
			'mainMessage' => $request->get('mainMessage'),
			'subMessage'=>'This was set in the doSub() method'
		];
		return $app['twig']->render('subrequest/sub.html.twig', $viewData);
	}

}
