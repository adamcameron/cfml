<?php
// passingNamed.php

function usingFixedArgSet($arg1, $arg2, $arg3){
	echo "Defined arguments:\r\n";
	var_dump(get_defined_vars());

	echo "\r\nAll arguments:\r\n";
	var_dump(func_get_args());
}

echo "Passing named args\r\n";
$args = ['arg1'=>'arg1 value', 'arg2'=>'arg2 value', 'arg3'=>'arg3 value'];
usingFixedArgSet(...$args);
