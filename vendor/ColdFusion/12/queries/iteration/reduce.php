<?php

$week = [
	["id"=>1,"en"=>"Monday","mi"=>"Rāhina"],
	["id"=>2,"en"=>"Tuesday","mi"=>"Rātū"],
	["id"=>3,"en"=>"Wednesday","mi"=>"Rāapa"],
	["id"=>4,"en"=>"Thursday","mi"=>"Rāpare"],
	["id"=>5,"en"=>"Friday","mi"=>"Rāmere"],
	["id"=>6,"en"=>"Saturday","mi"=>"Rāhoroi"],
	["id"=>7,"en"=>"Sunday","mi"=>"Rātapu"]
];

$shortestMaoriDayName = array_reduce($week, function($shortest, $number){
	if (strlen($shortest) == 0) return $number["mi"];
	return strlen($number["mi"]) < strlen($shortest) ? $number["mi"] : $shortest;
}, "");

echo $shortestMaoriDayName;
