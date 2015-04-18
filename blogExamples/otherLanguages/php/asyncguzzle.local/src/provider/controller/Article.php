<?php
// Article.php
namespace me\adamcameron\asyncguzzle\provider\controller;

use Silex;
use Silex\ControllerProviderInterface;

class Article implements ControllerProviderInterface {

	public function connect(Silex\Application $app){
		$controllers = $app['controllers_factory'];

		$controllers->get('/{id}', '\me\adamcameron\asyncguzzle\controller\Article::doGet')
			->method('GET')
			->bind('route.articleById')
			->assert('id', '\d+');
		return $controllers;
	}

}
