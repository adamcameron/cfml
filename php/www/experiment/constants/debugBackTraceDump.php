<?php
// debugBackTraceDump.php

require "../../debug/dBug.php";

function f()
{
    new dBug(debug_backtrace());
}

f();
echo "<hr>";

$g = "f";
$g();
