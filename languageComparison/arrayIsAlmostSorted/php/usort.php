<?php
$arrayIsAlmostSorted = function ($array) {
	$tally = 0;
	usort($array, function($e1, $e2) use (&$tally){
		$comparison = $e2 - $e1;
		if ($comparison < 0) {
			$tally++;
		}
		//printf("%d %d %d %d%s", $e1, $e2, $comparison, $tally, PHP_EOL);
		return $e2 - $e1;
	});
	return $tally <= 1;
};

require __DIR__ . "\Tester.php";
Tester::runTests($arrayIsAlmostSorted);
