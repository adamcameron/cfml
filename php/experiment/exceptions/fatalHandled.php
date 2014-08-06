<?php
// fatalHandled.php

register_shutdown_function(function(){
	$error = error_get_last();
	print_r($error);

	// log error or some other handling of it here
});

ini_set("display_errors", false);

try {
	echo "Before error<br>";
	$doNotExist = null;
	$doNotExist->method();
	echo "After error<br>";
} catch (Exception $e){
	echo "Exception was caught: " . $e->getMessage();
}
echo "End of file<br>";