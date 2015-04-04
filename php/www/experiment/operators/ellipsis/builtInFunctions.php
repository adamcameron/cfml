<?php
echo "Baseline using fixed args\r\n";
$result = str_repeat('X', 10);
echo "$result\r\n\r\n";

$args = ['Y', 10, 'EXTRA'];

echo "Control using UDF\r\n";
$result = _str_repeat(...$args);
echo "$result\r\n\r\n";

echo "Experiment using BIF\r\n";
$result = str_repeat(...$args);
echo "$result\r\n\r\n";

function _str_repeat($input, $multiplier){
	var_dump(func_get_args());
	return str_repeat($input, $multiplier);
}


echo "Experiment using UDF passing too many hard-coded arguments\r\n";
$result = _str_repeat('Z', 10, 'EXTRA');
echo "$result\r\n\r\n";

