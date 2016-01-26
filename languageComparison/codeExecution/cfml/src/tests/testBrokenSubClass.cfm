<?php
writeOutput("#getCurrentTemplatePath()# read<br>");

require_once __DIR__ . '/../../vendor/autoload.php';
echo 'autoload.php executed' . PHP_EOL;

use \dac\BrokenSubClass;
echo 'BrokenSubClass used' . PHP_EOL;

echo 'before BrokenSubClass instance created' . PHP_EOL;
$brokenSubClass = new BrokenSubClass();
echo 'after BrokenSubClass instance created' . PHP_EOL;

var_dump($brokenSubClass);
