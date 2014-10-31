<?php
$numbers = ["tahi","rua","toru","wha","rima","ono","whitu","waru","iwa","tekau"];
$index = array_flip($numbers);
$mappedNumbers = array_map(function ($value, $index) {
    return "$index: $value";
}, $numbers, $index);
echo "<pre>";
var_dump($mappedNumbers);
echo "</pre><hr>";
