<?php
// array_udiff.php

require "arrays.php";

$tally = 0;
$diff = array_udiff($first, $second, function ($e1,$e2) use (&$tally) {
    $comparison = gmp_sign($e1["value"] - $e2["value"]);
    printf('(%d) $e1: %s<br>$e2: %s; comparison: %d<hr>', ++$tally, json_encode($e1), json_encode($e2), $comparison);
    return $comparison;
});

echo "<pre>";
var_dump($diff);
echo "</pre>";
