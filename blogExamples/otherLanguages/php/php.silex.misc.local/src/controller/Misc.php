<?php
// Misc.php
namespace me\adamcameron\misc\controller;

use Silex\Application;
use Symfony\Component\HttpFoundation\Request;

use me\adamcameron\misc\model\Person;
use me\adamcameron\misc\model\PrivatePerson;

class Misc {

	public static function listRoutes(Request $request, Application $app){
		return $app['twig']->render('listRoutes.html.twig', ['routes' => $allRoutes = $app['routes']]);
	}

	public static function showDebugInfo(Request $request, Application $app){
        $personDebug = self::captureOutput(function(){
            $person = new Person('Iris', 'Murdoch');
            var_dump($person);
        });
        $privatePersonDebug = self::captureOutput(function(){
            $privatePerson = new PrivatePerson('Mary', 'Wollstonecraft');
            var_dump($privatePerson);
        });
		return $app['twig']->render('debugInfo.html.twig', ['personDebug' => $personDebug, 'privatePersonDebug' => $privatePersonDebug]);
	}

	public static function dOBlank(Request $request, Application $app){
		return $app['twig']->render('blank.html.twig');
	}

    private static function captureOutput($task){
        ob_start();
        $task();
        return ob_get_clean();
    }

}
