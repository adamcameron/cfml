<?php
$numbers = ["tahi","rua","toru","wha","rima","ono","whitu","waru","iwa","tekau"];
$mappedNumbers = array_map(function ($value) {
    return strtoupper($value);
}, $numbers);
echo "<pre>";
var_dump($mappedNumbers);
echo "</pre>";
