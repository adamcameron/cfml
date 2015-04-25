<?php
// SubMaster.php
namespace me\adamcameron\twig\controller;

use Silex\Application;
use Symfony\Component\HttpFoundation\Request;

class SubMaster {

	public static function doGet(Request $request, Application $app){
		$viewData = [
			'valueForSubMaster' => $request->get('valueForSubMaster')
		];
		return $app['twig']->render('subMaster.html.twig', $viewData);
	}

}
