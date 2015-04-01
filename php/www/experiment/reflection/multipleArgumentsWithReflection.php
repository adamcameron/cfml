<?php
function executePrivateMethod($object, $method, $arguments){
	$reflectedMethod = new \ReflectionMethod($object, $method);
	$reflectedMethod->setAccessible(true);

	$result = $reflectedMethod->invoke($object, ...$arguments);
	return $result;		
}


class Test {
	private function sumThree($x, $y, $z){
		return $x + $y + $z;
	}
}

$object = new Test();

/*
try {
	$result = $object->sumThree(1,2,3);
	echo $result;
}catch (Exception $e){
	echo "$e";
}
*/

$result = executePrivateMethod($object, 'sumThree', [1,2,3]);

echo $result;
