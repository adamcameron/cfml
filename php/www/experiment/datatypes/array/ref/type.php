<?php
echo "<hr>Initialise<br>";
$a = 1;
xdebug_debug_zval('a');

echo "<hr>Copy<br>";
$b = $a;
xdebug_debug_zval('a');
xdebug_debug_zval('b');

echo "<hr>Ref<br>";
$c = &$a;
xdebug_debug_zval('a');
xdebug_debug_zval('b');
xdebug_debug_zval('c');

echo "<hr>Change<br>";
$c = 2;
xdebug_debug_zval('a');
xdebug_debug_zval('b');
xdebug_debug_zval('c');




