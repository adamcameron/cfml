<?php
$path = "sub/inc.php";
$paths = [$path,"./$path"];
array_walk($paths, function($path){
    echo "Including: $path\n";
    include $path;
});
