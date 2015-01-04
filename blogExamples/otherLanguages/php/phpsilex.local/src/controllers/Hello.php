<?php
// Hello.php

namespace dac\silexdemo\controllers;

class Hello {

	static function doGet($name){
		return "G'day $name";
	}

}