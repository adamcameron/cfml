<?php
// OutputBuffering.php
namespace me\adamcameron\misc\controller;

use me\adamcameron\misc\model\Person;
use Silex\Application;
use Symfony\Component\HttpFoundation\Request;

class OutputBuffering {

	public static function showBasic(Request $request, Application $app){
        $person = new Person('Simone', 'de Beauvoir');
        ob_start();
        echo '<pre>';
        var_dump($person);
        echo '</pre>';
        $capturedOutput = ob_get_clean();

        return $capturedOutput;
	}

    private static function captureOutput($task){
        ob_start();
        $task();
        return ob_get_clean();
    }

}
