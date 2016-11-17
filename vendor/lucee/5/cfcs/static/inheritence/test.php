<?php

class GP {

	public static $test = "GP";
	
	public function fromGP(){
		return self::$test;
	}
	
	public function get(){
		return self::$test;
	}

}

class P extends GP {

	public static $test = "P";
	
	public function fromP(){
		return self::$test;
	}

}

class C extends P {

	public static $test = "C";
	
	public function fromC(){
		return self::$test;
	}

}

$c = new C();

echo "fromC: " . $c->fromC() . PHP_EOL;
echo "fromP: " . $c->fromP() . PHP_EOL;
echo "fromGP: " . $c->fromGP() . PHP_EOL;
echo "get: " . $c->get() . PHP_EOL;


