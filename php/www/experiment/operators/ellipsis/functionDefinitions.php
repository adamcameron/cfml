<?php
function justParams(...$params){
	echo "justParams()\r\n";
	var_dump(get_defined_vars());
	echo str_repeat('=', 40). "\r\n";
}

function namedArgsThenParams($arg1, $arg2, ...$params){
	echo "namedArgsThenParams()\r\n";
	var_dump(get_defined_vars());
	echo str_repeat('=', 40). "\r\n";
}

/*
not supported
function paramsThenNamedArgs(...$params, $arg1, $arg2){
	echo "paramsThenNamedArgs()\r\n";
	var_dump(get_defined_vars());
	echo str_repeat('=', 40). "\r\n";
}
*/

justParams('tahi', 'rua', 'toru', 'wha');
namedArgsThenParams('tahi', 'rua', 'toru', 'wha');
