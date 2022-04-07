<?php
// orderedSubset.php

$numbers = [
	"one" => [
		"maori"	=> "tahi",
		"roman"	=> "i"
	],
	"two" => [
		"maori"	=> "rua",
		"roman"	=> "ii"
	],
	"three" => [
		"maori"	=> "toru",
		"roman"	=> "iii"
	],
	"four" => [
		"maori"	=> "wha",
		"roman"	=> "iv"
	]
];

$digits = ["four", "two"];

$answer = array_map(function($element) use ($numbers, &$digits){
	return $numbers[array_shift($digits)];
}, array_flip($digits));

echo "<hr><pre>";
var_dump($answer);
echo "</pre>";

$digits = ["four", "two"];

$answer = array_combine($digits, array_map(function($element, $key) use ($numbers){
	return $numbers[$key];
}, array_flip($digits), $digits));

echo "<hr><pre>";
var_dump($answer);
echo "</pre>";


$answer = array_combine($digits, array_map(function($key) use ($numbers){
	return $numbers[$key];
}, $digits));

echo "<hr><pre>";
var_dump($answer);
echo "</pre>";
