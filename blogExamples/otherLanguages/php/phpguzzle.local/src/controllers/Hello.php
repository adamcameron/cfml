<?php
// Hello.php

namespace dac\guzzledemo\controllers;

class Hello {

	static function doGet($name){
		return "G'day $name";
	}

}