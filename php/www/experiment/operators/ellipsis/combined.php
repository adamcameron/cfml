<?php
function justParams(...$params){
	echo "justParams()\r\n";
	var_dump(get_defined_vars());
	echo str_repeat('=', 40). "\r\n";
}


echo "Passing three\r\n";
$args = ['tahi', 'rua', 'toru'];
justParams(...$args);


echo "Passing four\r\n";
$args = ['tahi', 'rua', 'toru', 'wha'];
justParams(...$args);


echo "Passing two\r\n";
$args = ['tahi', 'rua'];
justParams(...$args);
