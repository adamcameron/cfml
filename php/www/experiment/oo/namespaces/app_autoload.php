<?php
// app_autoload.php
spl_autoload_register(null, false);
spl_autoload_extensions(".class.php");

spl_autoload_register(function ($className) {
    $className = ltrim($className, '\\');
    $fileName  = '';
    $lastNsPos = strrpos($className, '\\');
    if ($lastNsPos) {
        $namespace = substr($className, 0, $lastNsPos);
        $className = substr($className, $lastNsPos + 1);
        $fileName  = str_replace('\\', DIRECTORY_SEPARATOR, $namespace) . DIRECTORY_SEPARATOR;
    }
    $fileName .= str_replace('_', DIRECTORY_SEPARATOR, $className) . '.class.php';

    if (is_file($fileName)) {
        return require $fileName;
    }
    throw new Exception("$className was resolved to $fileName which was not found");

});
