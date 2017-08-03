<?php
// see http://sandbox.onlinephpfunctions.com/code/c2e158832b4f3abe0d9e0a9b23aa99ecc860440d

class Base{
	public function doThing(Base $obj) {
		echo 'Base: ' . get_class($obj) . PHP_EOL;
	}
}

class Sub extends Base {
	public function doThing(Sub $obj) {
		echo 'Sub: ' . get_class($obj) . PHP_EOL;
	}
}

$sub = new Sub();
$sub->doThing($sub);
