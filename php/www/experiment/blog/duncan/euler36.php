<?php
// euler36.php

$start = microtime(true);

require "Palindrome.class.php";

$sum = 0;
foreach(Palindrome::createPalindromeSequence(1000000) as $x){
	$asBinary = decbin($x);
	if (Palindrome::isPalindrome($asBinary)){	
		echo $x . " " . $asBinary . "<br>";
		$sum += $x;
	}
}
echo $sum . "<hr>";

$end = microtime(true);

printf("Execution time: %dms", ($end - $start) * 1000);

