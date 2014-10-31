<?php

$en = ["one", "two", "three", "four"];
$mi = ["tahi", "rua", "toru", "wha"];

$new = array_map(function ($first, $second) {
    return "$first:$second";
}, $en, $mi);

echo "<pre>";
var_dump($new);
echo "</pre>";
