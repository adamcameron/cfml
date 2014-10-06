<?php
// kv.php

$numbers = ["one"=>"tahi", "two"=>"rua", "three"=>"toru", "four"=>"wha"];

array_map(function(){
	echo "<pre>";
	var_dump(func_get_args());
	echo "</pre><br>";
}, $numbers);