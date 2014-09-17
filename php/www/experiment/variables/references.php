<?php
// references.php

require "../../debug/dBug.php";

$original = "tahi,rua,toru";
$copy       = $original;
$reference = &$original;

$original .= ",wha";
$reference .= ",rima";
$copy .= ",ono";

echo "original: $original<br>reference: $reference<br>copy: $copy<br>";
echo "<hr>";

$original = ["red"=>"whero", "orange"=>"karaka", "yellow"=>"kowhai"];
$reference = &$original;
$copy = $original;

$original["green"] = "kakariki";
$original["blue"] = "kikorangi";
$copy["indigo"] = "poropango";

new dBug($original);
new dBug($reference);
new dBug($copy);
echo "<hr>";

$reference = "and now for something completely different";
echo "original: $original<br>reference: $reference<br>";
new dBug($copy);
echo "<hr>";


function increment(&$x)
{
    $x++;
}

$i = 0;
echo "\$i before: $i<br>";
increment($i);
echo "\$i after: $i<br>";
