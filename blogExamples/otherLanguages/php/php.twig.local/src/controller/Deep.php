<?php
// Deep.php
namespace me\adamcameron\twig\controller;

use me\adamcameron\twig\model\Person;
use Silex\Application;
use Symfony\Component\HttpFoundation\Request;

class Deep {

	public static function doDefaultDoc(Request $request, Application $app){
		return $app['twig']->render('deep/doc.html.twig');
	}

	public static function doDefaultLayout(Request $request, Application $app){
		return $app['twig']->render('deep/layout.html.twig');
	}

	public static function doSample(Request $request, Application $app){
		return $app['twig']->render('deep/sample.html.twig');
	}

	public static function doActualSimple(Request $request, Application $app){
        $user = 'Bertrand Russell';
		return $app['twig']->render('deep/actual.html.twig', ['user'=>$user, 'format'=>'simple']);
	}

    public static function doActualComplex(Request $request, Application $app){
        $user = new Person('David', 'Hume');
        return $app['twig']->render('deep/actual.html.twig', ['user'=>$user, 'format'=>'complex']);
    }

	public static function doUserSummary(Request $request, Application $app){
        $user = $request->get('user');
        $format = $request->get('format');
		return $app['twig']->render('deep/user.html.twig', ['user'=>$user, 'format'=>$format]);
	}

}
