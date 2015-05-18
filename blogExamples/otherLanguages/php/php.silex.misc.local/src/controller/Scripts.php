<?php
// Scripts.php
namespace me\adamcameron\misc\controller;

use Silex\Application;
use Symfony\Component\HttpFoundation\Request;


class Scripts {

	public static function cliOnly(Request $request, Application $app){
        return "hi";
	}

}
