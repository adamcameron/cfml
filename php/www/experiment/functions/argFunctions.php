<?php
// argFunctions.php

echo is_file("../../debug/dBug.php");

//require "../../debug/dBug.php";

function f()
{
    echo sprintf ("Count: %s<hr>", func_num_args());
    foreach(func_get_args() as $argName=>$argValue){
        echo sprintf("%s: %s<br>", $argName, $argValue);
    }
}

function g($arg1)
{
    echo sprintf ("Count: %s<hr>", func_num_args());
    foreach(func_get_args() as $argName=>$argValue){
        echo sprintf("%s: %s<br>", $argName, $argValue);
    }
}

function h($arg1, $arg2, $arg3=null)
{
    echo sprintf ("Count: %s<hr>", func_num_args());
    foreach(func_get_args() as $argName=>$argValue){
        echo sprintf("%s: %s<br>", $argName, $argValue);
    }
}

f("tahi", "rua");
echo "<hr>";
g("tahi", "rua");
echo "<hr>";
h("tahi", "rua");
echo "<hr>";
