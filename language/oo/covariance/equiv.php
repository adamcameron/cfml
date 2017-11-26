<?php
// see http://sandbox.onlinephpfunctions.com/code/c2e158832b4f3abe0d9e0a9b23aa99ecc860440d

interface Thingable {
	
	function doThing(Thingable $obj);
}


class Base{
	public function doThing(Thingable $obj) {
		echo 'Base: ' . get_class($obj) . PHP_EOL;
	}
}

class Sub extends Base {
	public function doThing(Thingable $obj) {
		echo 'Sub: ' . get_class($obj) . PHP_EOL;
	}
}

$sub = new Sub();
$sub->doThing($sub);
