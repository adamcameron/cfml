<?php
// testFunctionExpression.php

$f = function () {
    echo sprintf("Using __FUNCTION__: %s() called<br>", __FUNCTION__);
};

$f();
echo "<hr>";

$g = $f;
$g();
