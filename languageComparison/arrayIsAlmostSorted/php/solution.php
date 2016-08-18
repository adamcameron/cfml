<?php
$arrayIsAlmostSorted = function ($array) {
	$sorted = $array;
	sort($sorted);
	
	if ($array == $sorted) {
		return true;
	}
	
	$some = function($array, $callback) {
		$result = false;

		foreach($array as $i=>$v){
			$result = $callback($v, $i);
			if ($result) break;
		}
		return $result;
	};
	
	$swap = function($array, $i1, $i2){
		$temp = $array[$i1];
		$array[$i1] = $array[$i2];
		$array[$i2] = $temp;
		
		return $array;
	};
	
	return $some($array, function($_, $i1) use ($array, $some, $swap, $sorted) {
		$restOfArray = array_slice($array, $i1+1);
		return $some($restOfArray, function($_, $i2) use ($array, $i1, $swap, $sorted) {
			$indexToSwapWith = $i1 + $i2 + 1;
			$swappedArray = $swap($array, $i1, $indexToSwapWith);
			return $sorted == $swappedArray;
		});
	});
};

require __DIR__ . "\Tester.php";
Tester::runTests($arrayIsAlmostSorted);
