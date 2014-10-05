<?php
printf("Currently in %s\n", __FILE__);
printf("cwd: %s\n\n", getcwd());
echo "including includeMe.php\n";
include "includeMe.php";
echo "including ./includeMe.php\n";
include "./includeMe.php";
echo "================================\n\n";
