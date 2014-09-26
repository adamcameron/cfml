<?php
// app_autoload.php
spl_autoload_register(null, false);
spl_autoload_extensions('.class.php, .interface.php, .trait.php');
spl_autoload_register(function ($class) {
    foreach (["class", "interface", "trait"] as $fileType) {
        $filePath = "$class.$fileType.php";
        if (is_file($filePath)){
            return require $filePath;
        }
    }
});
