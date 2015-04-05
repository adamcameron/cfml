<?php
// functionUsage.php

function usingFixedArgSet($arg1, $arg2, $arg3){
	echo "Defined arguments:\r\n";
	var_dump(get_defined_vars());

	echo "\r\nAll arguments:\r\n";
	var_dump(func_get_args());
}

echo "Passing correct number\r\n";
$args = ['arg1 value', 'arg2 value', 'arg3 value'];
usingFixedArgSet(...$args);


echo "Passing too many\r\n";
$args = ['arg1 value', 'arg2 value', 'arg3 value', 'arg4 value'];
usingFixedArgSet(...$args);


echo "Passing too few\r\n";
$args = ['arg1 value', 'arg2 value'];
usingFixedArgSet(...$args);

