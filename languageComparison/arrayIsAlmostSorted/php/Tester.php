<?php
class Tester {

	static $tests = [
		["description"=>"already sorted, values contiguous", "array"=>[1,2,3,4,5], "expected"=>true],
		["description"=>"already sorted, values not contiguous", "array"=>[2,4,6,8,10], "expected"=>true],
		["description"=>"off by one, first pair", "array"=>[2,1,3,4,5], "expected"=>true],
		["description"=>"off by one, subsequent pair", "array"=>[1,2,4,3,5], "expected"=>true],
		["description"=>"off by one, last pair", "array"=>[1,2,3,5,4], "expected"=>true],
		["description"=>"off by one, first and last", "array"=>[5,2,3,4,1], "expected"=>true],
		["description"=>"off by one, first and middle", "array"=>[3,2,1,4,5], "expected"=>true],
		["description"=>"off by one, last and middle", "array"=>[1,2,5,4,3], "expected"=>true],
		["description"=>"off by two, first two pairs", "array"=>[2,1,4,3,5], "expected"=>false],
		["description"=>"off by two, last two pairs", "array"=>[1,3,2,5,4], "expected"=>false],
		["description"=>"off by two, first and last pairs", "array"=>[2,1,3,5,4], "expected"=>false],
		["description"=>"off by two, within three elements", "array"=>[2,3,1,4,5], "expected"=>false],
		["description"=>"off by many, reversed", "array"=>[5,4,3,2,1], "expected"=>false]
	];
	
	static function runTests($functionToTest, $testSet=null){
		$testsToRun = is_null($testSet) ? self::$tests : array_map(function($i) {
			return self::$tests[$i];
		}, $testSet);
	
		foreach($testsToRun as $i=>$test) {
			$message = null;
			try {
				$result = $functionToTest($test["array"]);
				$pass = $result == $test["expected"] ? "PASS" : "FAIL";
				$message = "{$i} {$test["description"]} => {$test["expected"]} ({$pass})";
			} catch (Exception $e){
				$message = "$i {$e->getMessage()}";
			} finally {
				echo $message . PHP_EOL;
			}
		}
	}
}
