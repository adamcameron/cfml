<?php
// Read.php
namespace me\adamcameron\controllerprovider\controller\user;

use Silex\Application;
use Symfony\Component\HttpFoundation\Request;

class Read {

	public static function readOne(Request $request, Application $app){
		$id = $request->get('id');
		return $app['twig']->render('message.html.twig', ['msg'=>"Read::readOne($id)"]);
	}

	public static function readAll(Request $request, Application $app){
		return $app['twig']->render('message.html.twig', ['msg'=>"Read::readAll()"]);
	}

}