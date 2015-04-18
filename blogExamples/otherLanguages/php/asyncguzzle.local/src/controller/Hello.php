<?php
// Hello.php
namespace me\adamcameron\asyncguzzle\controller;

class Hello {

	public static function doGet($name){
		return "G'day $name";
	}

}