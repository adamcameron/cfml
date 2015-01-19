<?php
// Links.php

namespace dac\silex\controllers;

class Links {

	static function doGet($name){
		return $this->twig->render('links.html.twig');
	}
}