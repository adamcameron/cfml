<?php
// app_autoload.php
spl_autoload_register(null, false);
spl_autoload_extensions('.class.php, .interface.php');
spl_autoload_register(function($class){
	$filePath = "./classes/" .$class . ".class.php";
	if (is_file($filePath)){
		return require $filePath;
	}
	require "./classes/" .$class . ".interface.php";
});
