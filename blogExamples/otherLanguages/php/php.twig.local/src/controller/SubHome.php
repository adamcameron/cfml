<?php
// SubHome.php
namespace me\adamcameron\twig\controller;

use Silex\Application;
use Symfony\Component\HttpFoundation\Request;

class SubHome {

	public static function doGet(Request $request, Application $app){
		$messageFromHome = $request->get('messageFromHome');

		echo '<pre>';
		echo '</pre>';

		$viewData = [
			'messageFromSubHome' => 'this was set in the SubHome controller',
			'messageFromHome' => $messageFromHome
		];
		return $app['twig']->render('subhome.html.twig', $viewData);
	}

}