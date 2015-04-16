<?php
// testC.php
require __DIR__ . '\..\vendor\autoload.php';

$child = new \mockSuperMethods\C();
echo $child->g();