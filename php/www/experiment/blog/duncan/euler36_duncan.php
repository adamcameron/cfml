<?php
// duncaneuler36.php


$start = microtime(true);
$sum = 0;

function isPalindrome($x)
{
    return $x == strrev($x);
}

for ($i = 1;$i <= 999999; $i++) {
    if (isPalindrome($i) && isPalindrome(decbin($i))) {
        echo $i . " " . decbin($i) . "<br>";
        $sum += $i;
    }
}

echo $sum . "<hr>";

$end = microtime(true);

printf("Execution time: %dms", ($end - $start) * 1000);
