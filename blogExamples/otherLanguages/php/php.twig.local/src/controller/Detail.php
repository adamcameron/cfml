<?php
// Home.php
namespace me\adamcameron\twig\controller;

use Silex\Application;
use Symfony\Component\HttpFoundation\Request;

class Detail {

	public static function doGet(Request $request, Application $app){
		$viewData = [
			'dynamicValue' => 'Set in Detail controller',
			'valueForSubMasterFromController' => 'Submaster value set in Detail controller'
		];
		return $app['twig']->render('detail.html.twig', $viewData);
	}

}