<?php
// array_map.php

$awards = [
	"award_year" => ["1999-01", "2010-12"],
	"award_title_user" => ["2", "tt"],
	"award_description_user" => ["2", "ddd"]
];

$remappedAwards = array_map(function($year, $title, $description){
	return [
		"award_year" => $year,
		"award_title_user" => $title,
		"award_description_user" => $description
	];
}, $awards["award_year"], $awards["award_title_user"], $awards["award_description_user"]);

$remappedAwards = array_reverse($remappedAwards);

echo "<pre>";
var_dump($remappedAwards);
echo "</pre>";