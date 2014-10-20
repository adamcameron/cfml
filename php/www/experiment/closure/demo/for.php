<?php
$numbers = ["tahi","rua","toru","wha","rima","ono","whitu","waru","iwa","tekau"];
for($i=count($numbers); $i--;){
    $value = &$numbers[$i];
    echo "\$value before: $value<br>";
    $value = "[$i] $value";
    echo "\$value after: $value<br><hr>";
}
echo "<pre>";
var_dump($numbers);
echo "</pre>";