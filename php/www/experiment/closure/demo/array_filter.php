<?php
$numbers = ["tahi","rua","toru","wha","rima","ono","whitu","waru","iwa","tekau"];

$evens = array_filter($numbers, function ($number, $index) {
    return ($index+1) % 2 == 0;
}, true);

echo "<pre>";
var_dump($evens);
echo "</pre>";
