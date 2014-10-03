<?php
printf("Currently in %s\n", __FILE__);
printf("cwd: %s\n", getcwd());

$thisDir = dirname(__FILE__) . DIRECTORY_SEPARATOR;
printf("Base include path: %s\n\n", $thisDir);

echo "including {$thisDir}includeMe.php\n";
include "{$thisDir}includeMe.php";
echo "including {$thisDir}./includeMe.php\n";
include "{$thisDir}./includeMe.php";
echo "================================\n\n";
