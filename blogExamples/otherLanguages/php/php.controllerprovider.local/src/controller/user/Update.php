<?php
// Home.php
namespace me\adamcameron\controllerprovider\controller\user;

use Silex\Application;
use Symfony\Component\HttpFoundation\Request;

class Update {

	public static function doGet(Request $request, Application $app){
		return $app['twig']->render('message.html.twig', ['msg'=>"Update::doGet()"]);
	}

	public static function doPost(Request $request, Application $app){
		return $app['twig']->render('message.html.twig', ['msg'=>"Update::doPost()"]);
	}

}