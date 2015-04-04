<?php

function usingFixedArgSet($arg1, $arg2, $arg3){
	var_dump(get_defined_vars());
	echo str_repeat('=', 40). "\r\n";
}

echo "Passing correct number\r\n";
$args = ['tahi', 'rua', 'toru'];
usingFixedArgSet(...$args);


echo "Passing too many\r\n";
$args = ['tahi', 'rua', 'toru', 'wha'];
usingFixedArgSet(...$args);


echo "Passing too few\r\n";
$args = ['tahi', 'rua'];
usingFixedArgSet(...$args);

