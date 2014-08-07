<?php
// fatal.php
set_error_handler (function($errno, $errstr, $errfile, $errline, $errcontext){
	throw new Exception($errstr, $errno);
});

try {
	$doNotExist = null;
	echo $doNotExist->method();
} catch (Exception $e){
	echo "Exception was caught: " . $e->getMessage();
}
echo "Next line to process<br>";