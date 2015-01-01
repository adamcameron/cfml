<?php
// HelloController.php

namespace dac\silex\controllers;

class HelloController {

	static function doGet($name){
		return "G'day $name";
	}
}