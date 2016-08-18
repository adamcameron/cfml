<?php
function arrayIsAlmostSorted($array) {
	$sorted = $array;
	sort($sorted);
	
	$breakOnBoolean = function($b){
		return function($array, $callback) use ($b){
			$result = !$b;
			foreach ($array as $i=>$v) {
				$result = $callback($v, $i);
				if ($result == $b) {
					return $result;
				}
			}
			return $result;
		};
	};
	$some = $breakOnBoolean(true);
	$every = $breakOnBoolean(false);
	
	$arraysAreEquivalent = function($a1, $a2) use ($every) {
		return $every($a1, function($v, $i) use ($a2) {
			return $v == $a2[$i];
		});
	};
	
	if ($arraysAreEquivalent($array, $sorted)) return true;
	
	$swap = function($array, $i, $j) {
		$temp = $array[$i];
		$array[$i] = $array[$j];
		$array[$j] = $temp;
		
		return $array;
	};
	
	return $some($array, function($_, $i) use ($array, $some, $swap, $arraysAreEquivalent, $sorted) {
		$restOfArray = array_slice($array, $i+1);

		return $some($restOfArray, function($_, $j) use ($i, $swap, $array, $arraysAreEquivalent, $sorted) {
			$indexToSwapWith = $i + $j + 1;
			$swappedArray = $swap($array, $i, $indexToSwapWith);
			return $arraysAreEquivalent($sorted, $swappedArray);
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


foreach($tests as $test){
	$expectation = $test[0];
	$testArray = $test[1];
	printf('%s => %d (Expectation: %d)%s', json_encode($testArray), arrayIsAlmostSorted($testArray), $expectation, PHP_EOL);
}
