<?php
$numbers = ["tahi","rua","toru","wha","rima","ono","whitu","waru","iwa","tekau"];
$mappedNumbers = array_map(function($value, $index){
    return "$index: $value";
}, $numbers, array_flip($numbers));
echo "<pre>";
var_dump($mappedNumbers);
echo "</pre>";