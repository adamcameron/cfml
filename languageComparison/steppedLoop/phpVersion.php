<?php
$numbers = ["tahi", "rua", "toru", "wha", "rima", "ono", "whitu", "waru", "iwa", "tekau"];

//echo "Using filter" . PHP_EOL;
$indexedNumbers = array_map(null, range(0, count($numbers)-1), $numbers);
$indexedOddNumbers = array_filter(
	$indexedNumbers,
	function($number){
		return ($number[0]+1) % 2;
	}
);
$reindexedIndexedOddNumbers = array_values($indexedOddNumbers);
$oddNumbers = array_map(
	function($number){
		return $number[1];
	},
	$reindexedIndexedOddNumbers
);

//echo "Odd numbers" . PHP_EOL;
//var_dump($oddNumbers);
//echo "=======================" . PHP_EOL;

//echo "Reducing filtered numbers" . PHP_EOL;
$oddNumbersAsString = array_reduce(
	$oddNumbers,
	function($combined, $oddNumber){
		return $combined . $oddNumber . PHP_EOL;
	},
	""
);
echo $oddNumbersAsString;
//echo "=======================" . PHP_EOL;

die;
?>




<?= "Equivalent of cfloop" . PHP_EOL ?>
<?php for ($i=0; $i < count($numbers); $i+=2) { ?>
	<?= $numbers[$i] . PHP_EOL ?>
<?php } ?>
<?= "=======================" . PHP_EOL ?>