<?php

function f()
{
    echo sprintf("Using __FUNCTION__: %s() called<br>", __FUNCTION__);
    $dbt = debug_backtrace();
    echo sprintf("Using debug_backtrace(): line: %s; function: %s()<br>", $dbt[0]["line"], $dbt[0]["function"]);
}

f();
echo "<hr>";

$g = "f";
$g();
