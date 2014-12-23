<?php
// HelloController.php

namespace dac\restapi\controllers;

class HelloController {

	static function doGet($name){
		return "G'day $name";
	}
}