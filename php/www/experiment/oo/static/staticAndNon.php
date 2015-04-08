<?php

class Test {
	public static function f(){
		echo('From static method<br>');
	}

	public function f(){
		echo('From non-static method<br>');
	}

}

$o = new Test();
$o::f();
$o->f();
