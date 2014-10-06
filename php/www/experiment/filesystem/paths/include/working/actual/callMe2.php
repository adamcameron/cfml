<?php
// callMe2.php
printf("Working directory: %s\n\n\n", getcwd());
echo "including incExistsOnlyInActual.php\n";
include "incExistsOnlyInActual.php";

echo "\n\n";
echo "including ./incExistsOnlyInActual.php\n";
include "./incExistsOnlyInActual.php";

echo "\n\n================================\n\n";

echo "including incExistsInActualAndWorking.php\n";
include "incExistsInActualAndWorking.php";

echo "\n\n";
echo "including ./incExistsInActualAndWorking.php\n";
include "./incExistsInActualAndWorking.php";
