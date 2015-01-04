<?php
// User.php

namespace dac\silexdemo\controllers;

class User {

	protected $twig;
	protected $userService;

	function __construct($twig, $userService){
		$this->twig = $twig;
		$this->userService = $userService;
	}

	function getUser($id){
		$user = $this->userService->getUser($id);

		return $this->twig->render('user.html.twig', array(
			'user' => $user,
		));
	}

}