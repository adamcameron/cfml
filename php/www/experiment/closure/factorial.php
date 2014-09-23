<?php
// factorial.php

$f = function ($x) use ($f) {
    return $x > 1 ? $x * $f($x-1) : 1;
};


echo $f(4);
