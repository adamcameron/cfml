<?php
$array = [[
	"id" => 1,
	"value" => 100
	],[
	"id" => 1,
	"value" => 200
	],[
	"id" => 1,
	"value" => 300
	],[
	"id" => 2,
	"value" => 2
	],[
	"id" => 2,
	"value" => 5
	],[
	"id" => 3,
	"value" => 10.50
]];

$totals = array_reduce($array, function($reduction, $current){
	$id = $current["id"];
	if (empty($reduction[$id])){
		$reduction[$id] = ["id"=>$id, "sum_of_values"=>0];
	}
	$reduction[$id]["sum_of_values"] += $current["value"];
	return $reduction;
}, []);

echo "<pre>";
print_r($totals);
echo "</pre>";



