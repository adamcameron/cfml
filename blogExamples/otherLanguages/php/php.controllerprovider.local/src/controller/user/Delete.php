<?php
// Delete.php
namespace me\adamcameron\controllerprovider\controller\user;

use Silex\Application;
use Symfony\Component\HttpFoundation\Request;

class Delete {

	public static function doPost(Request $request, Application $app){
		return $app['twig']->render('message.html.twig', ['msg'=>"Delete::doPost()"]);
	}

}