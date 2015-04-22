<?php
// Home.php
namespace me\adamcameron\controllerprovider\provider\controller;

use Silex;

use Silex\ControllerProviderInterface;

class User implements ControllerProviderInterface {

	public function connect(Silex\Application $app){
		$controllers = $app['controllers_factory'];

		$controllers->get('create/', 'controller.user.create:doGet')
			->method('GET')
			->bind('route.user.create.get');

		$controllers->get('create/', 'controller.user.create:doPost')
			->method('POST')
			->bind('route.user.create.post');

		$controllers->get('read/{id}/', 'controller.user.read:readOne')
			->method('GET')
			->bind('route.user.read.one');

		$controllers->get('read/', 'controller.user.read:readAll')
			->method('get')
			->bind('route.user.read.all');

		$controllers->get('update/', 'controller.user.update:doGet')
			->method('GET')
			->bind('route.user.update.get');

		$controllers->get('update/', 'controller.user.update:doPost')
			->method('POST')
			->bind('route.user.update.post');

		$controllers->get('delete/', 'controller.user.delete:doPost')
			->method('POST')
			->bind('route.user.delete.post');

		return $controllers;
	}

}
