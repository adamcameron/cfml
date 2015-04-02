<?php
function sumThree($x, $y, $z){
	return $x + $y + $z;
}

$args = [1,2,3];

$result = sumThree(...$args);

echo $result;
