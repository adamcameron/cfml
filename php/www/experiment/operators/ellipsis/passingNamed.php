<?php
function justParams(...$params){
	echo "justParams()\r\n";
	var_dump(get_defined_vars());
	echo str_repeat('=', 40). "\r\n";
}

echo "Passing named args\r\n";
$args = ['arg1'=>'tahi', 'arg2'=>'rua', 'arg3'=>'toru'];
justParams(...$args);
