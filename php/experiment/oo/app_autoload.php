<?php
// app_autoload.php
spl_autoload_register(null, false);
spl_autoload_extensions('.class.php');
spl_autoload_register(function($class){
	require "./classes/" .$class . ".class.php";
});