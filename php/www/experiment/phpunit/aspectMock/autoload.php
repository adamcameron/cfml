<?php
// autoload.php

spl_autoload_extensions('.class.php');
spl_autoload_register(function ($class) {
    $classesDir = dirname(__FILE__) . "/src/";
    $filePath = "$classesDir/$class.php";
    if (is_file($filePath)){
        return require $filePath;
    }
});