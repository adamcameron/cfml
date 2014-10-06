<?php
// baselineWithDebug.php

echo "<hr><h3><code>numbers</code> created</h3>";
$numbers = array("tahi", "rua", "toru");
xdebug_debug_zval('numbers');


echo "<hr><h3><code>refToSecondElement</code> created</h3>";
$refToSecondElement = &$numbers[1];
xdebug_debug_zval('numbers');
xdebug_debug_zval('refToSecondElement');


echo "<hr><h3><code>copyOfNumbers</code> created</h3>";
$copyOfNumbers = $numbers;
xdebug_debug_zval('numbers');
xdebug_debug_zval('refToSecondElement');
xdebug_debug_zval('copyOfNumbers');


echo "<hr><h3><code>copyOfNumbers[1]</code> changed</h3>";
$copyOfNumbers[1] = "two";
xdebug_debug_zval('numbers');
xdebug_debug_zval('refToSecondElement');
xdebug_debug_zval('copyOfNumbers');


echo "<hr><h3><code>copyOfNumbers[2]</code> changed</h3>";
$copyOfNumbers[2] = "three";
xdebug_debug_zval('numbers');
xdebug_debug_zval('refToSecondElement');
xdebug_debug_zval('copyOfNumbers');