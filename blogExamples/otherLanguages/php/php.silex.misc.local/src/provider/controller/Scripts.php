<?php
// Scripts.php
namespace me\adamcameron\misc\provider\controller;

use Silex;
use Silex\ControllerProviderInterface;
use Symfony\Component\HttpKernel\DataCollector\ConfigDataCollector;

class Scripts implements ControllerProviderInterface {

	public function connect(Silex\Application $app){
		$controllers = $app['controllers_factory'];
        if (php_sapi_name() === 'cli'){
            $controllers->get('/cliOnly/', 'controller.scripts:cliOnly')
                ->method('GET')
                ->bind('route.scriptsCliOnly');
        }
		return $controllers;
	}

}
