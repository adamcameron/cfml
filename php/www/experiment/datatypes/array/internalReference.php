<?php

$routes = [
	"en" => [
		"england" => [
			"london"		=> 1,
			"birmingham"	=> 1008
		]
	]
];

$routes["fr"] = [
	"angelterre" => [
		"londres"		=> &$routes["en"]["england"]["london"],
		"birmingham"	=> &$routes["en"]["england"]["birmingham"]
	]
];
$routes["en"]["england"]["london"] = 666;

echo "<pre>";
var_dump($routes);
echo "</pre>";
