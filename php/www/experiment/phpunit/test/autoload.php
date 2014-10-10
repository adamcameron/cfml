<?php

require __DIR__ . '/../vendor/autoload.php';

$kernel = \AspectMock\Kernel::getInstance();
$kernel->init([
    'debug' => true,
    'includePaths' => [__DIR__.'/../src']
]);


spl_autoload_register(null, false);
spl_autoload_extensions('.class.php');
spl_autoload_register(function ($class) {
    $classesDir = dirname(__FILE__) . "/../actual";
    $filePath = "$classesDir/$class.class.php";
    if (is_file($filePath)){
        return require $filePath;
    }
});