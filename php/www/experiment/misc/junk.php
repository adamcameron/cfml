<?php

$testResultString = "isset: as string: [%s]; as binary: [%b]; null: [%b]; type: [%s]; null equiv: [%b]<br>";

$does = true;
$set = isset($does);
echo sprintf($testResultString, $set , $set, is_null($set), gettype($set), $set == null);

$set = isset($doesNot);
echo sprintf($testResultString, $set , $set, is_null($set), gettype($set), $set == null);