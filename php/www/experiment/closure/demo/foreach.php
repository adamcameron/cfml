<?php
$numbers = ["tahi","rua","toru","wha","rima","ono","whitu","waru","iwa","tekau"];
foreach($numbers as $value => $index){
    echo "\$value before: $value<br>";
    $value = "[$index] $value";
    echo "\$value after: $value<br><hr>";
}
echo "<pre>";
var_dump($numbers);
echo "</pre>";
