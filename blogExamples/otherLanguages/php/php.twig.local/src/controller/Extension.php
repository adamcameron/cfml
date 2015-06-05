<?php
// Extension.php
namespace me\adamcameron\twig\controller;

use Silex\Application;
use Symfony\Component\HttpFoundation\Request;

class Extension {

	public static function doDump(Request $request, Application $app){

        $target = ['tahi', 'rua', 'toru', 'wha'];
        echo '<h4>Dumped from PHP code</h4>';
        new \dBug($target);

		return $app['twig']->render('extension/dump.html.twig', [
            'target' => $target
        ]);
	}

}
