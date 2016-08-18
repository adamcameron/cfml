<?php
function arrayIsAlmostSorted($array){
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
}

$tests = [
    // sorted
     [true,[1,2,3,4,5]]
    ,[true,[2,4,6,8,10]]
    
    // 1 swap
    ,[true,[1,2,3,5,4]]
    ,[true,[5,2,3,4,1]]
    ,[true,[1,2,3,5,3]]
    
    // +1 swap
    ,[false,[5,2,3,1,4]]
    ,[false,[2,3,1,5,4]]
    ,[false,[5,1,2,3,4]]
    ,[false,[2,3,1,5,4]]
    ,[false,[2,3,1,4,5]]
    ,[false,[1,2,3,5,2]]
];

foreach ($tests as $test) {
	$expectation = $test[0];
	$testArray = $test[1];
	printf("%s => %d (Expectation: %d)%s", json_encode($testArray), arrayIsAlmostSorted($testArray), $expectation, PHP_EOL);
}
