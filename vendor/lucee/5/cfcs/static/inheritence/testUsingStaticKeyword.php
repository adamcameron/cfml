<?php

class GP {

	public static $test = "GP";
	
	public function fromGP(){
		return static::$test;
	}
	
	public function get(){
		return static::$test;
	}

}

class P extends GP {

	public static $test = "P";
	
	public function fromP(){
		return static::$test;
	}

}

class C extends P {

	public static $test = "C";
	
	public function fromC(){
		return static::$test;
	}

}

$c = new C();

echo "fromC: " . $c->fromC() . PHP_EOL;
echo "fromP: " . $c->fromP() . PHP_EOL;
echo "fromGP: " . $c->fromGP() . PHP_EOL;
echo "get: " . $c->get() . PHP_EOL;


