<?php
$numbers = ["tahi","rua","toru","wha","rima","ono","whitu","waru","iwa","tekau"];
array_walk($numbers, function (&$valueRef, $index) {
    $valueRef = "[$index] $valueRef";
});
echo "<pre>";
var_dump($numbers);
echo "</pre>";
