<?php
// testFunction.php

function f()
{
    echo sprintf("Using __FUNCTION__: %s() called<br>", __FUNCTION__);
}

f();
echo "<hr>";

$g = "f";
$g();
