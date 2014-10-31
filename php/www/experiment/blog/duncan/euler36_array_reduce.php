<?php
// euler36_array_reduce.php

$start = microtime(true);

require "Palindrome.class.php";

$decPalindromes = [];
foreach(Palindrome::createPalindromeSequence(1000000) as $x){
    $decPalindromes[] = $x;
}


$sum = array_reduce($decPalindromes, function ($reduction, $current) {
    $asBinary = decbin($current);
    if (Palindrome::isPalindrome($asBinary)){
        echo $current . " " . $asBinary . "<br>";
        $reduction += $current;
    }
    return $reduction;
}, 0);

echo $sum . "<hr>";

$end = microtime(true);

printf("Execution time: %dms", ($end - $start) * 1000);
