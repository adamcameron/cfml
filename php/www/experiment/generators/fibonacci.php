<?php
// fibonacci.php

function createFibonacciSequence(){
	$queue = [0,1];
	while (true){
		$currentSum = array_sum($queue);
		array_push($queue, $currentSum);
		$nextInSequence = array_shift($queue);
		yield $nextInSequence;
	}
}


$fibonacciSequence = createFibonacciSequence();


for ($i=1; $i++ <= 10;){
	$nextFibonacciNumber = $fibonacciSequence->current();
	echo "$nextFibonacciNumber "; 
	$fibonacciSequence->next();
}
