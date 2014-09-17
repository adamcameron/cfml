<?php
// references.php

require "../../debug/dBug.php";

$original = "tahi,rua,toru";
$reference = &$original;

$original .= ",wha";
$reference .= ",rima";

echo "original: $original<br>reference: $reference<br>";
echo "<hr>";

$original = ["red"=>"whero", "orange"=>"karaka", "yellow"=>"kowhai"];
$reference = &$original;

$original["green"] = "kakariki";
$original["blue"] = "kikorangi";

new dBug($original);
new dBug($reference);
echo "<hr>";

$reference = "and now for something completely different";
echo "original: $original<br>reference: $reference<br>";
echo "<hr>";


function increment(&$x)
{
    $x++;
}

$i = 0;
echo "\$i before: $i<br>";
increment($i);
echo "\$i after: $i<br>";
