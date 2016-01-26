<?php
$requestedIndex = $argv[1];
$numbers = ["tahi", "rua", "toru", "wha"];

$elementIsNull = is_null($numbers[$requestedIndex]);
printf("The requested element is undefined: [%d]%s", $elementIsNull, PHP_EOL);

$requestedElement = $numbers[$requestedIndex];
echo "The element requested is: [$requestedElement]";
