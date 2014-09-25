<?php
$numbers = range(1,10);

array_walk($numbers, function ($v, $i) {
    echo "$v<br>";
    if ($v > 5) return false;
});
