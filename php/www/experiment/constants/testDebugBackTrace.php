<?php
// testDebugBackTrace.php

function f()
{
    $dbt = debug_backtrace();
    echo sprintf("Using debug_backtrace(): line: %s; function: %s()<br>", $dbt[0]["line"], $dbt[0]["function"]);
}

f();
echo "<hr>";

$g = "f";
$g();
