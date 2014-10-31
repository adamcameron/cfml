<?php
// resolutions.php

$fileName = $_SERVER['PHP_SELF'];
$fileNames = [$fileName, ".\\$fileName"];

array_walk($fileNames, function ($fileName) {
    echo "$fileName\n";
    printf("realpath(): %s\n\n", realpath($fileName));
});
