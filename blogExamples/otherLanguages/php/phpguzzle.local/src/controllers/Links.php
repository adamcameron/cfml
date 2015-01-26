<?php
// Links.php

namespace dac\guzzledemo\controllers;

class Links {

	protected $twig;

	function __construct($twig){
		$this->twig = $twig;
	}

	function doGet($name){
		return $this->twig->render('links.html.twig');
	}
}