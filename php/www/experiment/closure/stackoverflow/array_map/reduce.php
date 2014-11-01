<?php
$awards = [
	"award_year" => ["1999-01", "2010-12"],
	"award_title_user" => ["2", "tt"],
	"award_description_user" => ["2", "ddd"]
];

$awardsIterator = new ArrayIterator($awards);
$remappedAwards = array_reduce($awards, function($reduction, $current) use ($awardsIterator){
	$key = $awardsIterator->key();
	$offset = count($current) - 1;

	array_walk($current, function($value, $index) use (&$reduction, $offset, $key){
		$reduction[$offset-$index][$key] = $value;
	}, true);
	$awardsIterator->next();
	return $reduction;
}, [[],[]]);

echo "<pre>";
var_dump($remappedAwards);
echo "</pre>";
