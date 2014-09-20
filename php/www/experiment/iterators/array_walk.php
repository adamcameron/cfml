<?php
// array_walk.php
require "Numbers.class.php";
require "../../debug/dBug.php";

$numbers = new Numbers();
$numbers	-> push("one", "tahi")
			-> push("two", "rua")
			-> push("three", "toru")
			-> push("four", "wha");


array_walk($numbers, function(){
	new dBug(func_get_args());
});