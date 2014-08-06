<?php
// trappedError.php

set_error_handler (function($errno, $errstr, $errfile, $errline, $errcontext){
	throw new Exception($errstr, $errno);
});

$dividend = $_GET["dividend"];
$divisor = $_GET["divisor"];

echo "Dividend: $dividend<br>";
echo "Divisor: $divisor<br>";

try {
	$result = $dividend / $divisor;
	echo "$dividend / $divisor = $result";
	
} catch (Exception $e){
	echo "Exception was caught: " . $e->getMessage();
}