<?php
// multiple.php

$a = 17;
$b = 19;
$c = 23;

$a += ($b += $c);

var_dump([
	"a" => $a,
	"b" => $b,
	"c" => $c
]);
