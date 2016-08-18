<?php
$tests = [
	[1,2,3,4]/*,
	[1,3,2,4],
	[2,1,4,3],
	[4,3,2,1]*/
];

function isAlmostSorted($array) {
	$tally = 0;
	usort($array, function($e1, $e2) use (&$tally){
		printf("%s:%s%s", $e1, $e2, PHP_EOL);
		if ($e1 > $e2) {
			echo("inc" . PHP_EOL);
			$tally++;
		}
		return $e2 - $e1;
	});
	return $tally <= 1;
}

foreach($tests as $test){
	printf("%s: %d%s", json_encode($test), isAlmostSorted($test), PHP_EOL);
}