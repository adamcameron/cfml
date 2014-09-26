<?php
// numbers.php

require_once("./app.php");
$numbers = new Numbers();

echo "Use it as a string:<br>";
echo sprintf('echo $numbers: %s<hr>', $numbers);

echo "Use it as a function:<br>";
echo '$result = $numbers;<br>';
$result = $numbers();
new dBug($result);
echo "<hr>";

echo "Use it with var_export():<br>";
echo 'var_export($numbers);<br>';
$exported = var_export($numbers, true);

echo "\$exported: <code>$exported</code><br>";
$imported = eval($exported . ";");
new dBug($imported);



