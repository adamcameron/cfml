<?php
// functionDefinitions.php

function justParams(...$params){
	echo "Defined arguments:\r\n";
	var_dump(get_defined_vars());

	echo "\r\nAll arguments:\r\n";
	var_dump(func_get_args());
}

function namedArgsThenParams($arg1, $arg2, ...$params){
	echo "Defined arguments:\r\n";
	var_dump(get_defined_vars());

	echo "\r\nAll arguments:\r\n";
	var_dump(func_get_args());
}

/*
not supported
function paramsThenNamedArgs(...$params, $arg1, $arg2){
}
*/

//justParams('arg1 value', 'arg2 value', 'arg3 value', 'arg4 value');
// echo str_repeat('=', 40). "\r\n";

namedArgsThenParams('arg1 value', 'arg2 value', 'arg3 value', 'arg4 value');
