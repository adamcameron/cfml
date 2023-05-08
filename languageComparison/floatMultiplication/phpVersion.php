<?php
function reportResult($z, $label){
	echo "Result with " . $label . ": " . $z . ", integer check: [" . (is_int($z) ? "true" : "false") . "]" . PHP_EOL;
}

$x = 17.76;
$y = 100;

$z = $x * $y;
reportResult($z, "basic arithmetic");

$z = bcmul($x, $y, 10);
reportResult($z, "Binary Calculator");

