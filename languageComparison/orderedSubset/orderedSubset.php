<?php
// orderedSubset.php

$categories = [
	"one" => [
		"alphabet" => "a",
		"maori" => "tahi",
		"roman" => "i",
		"ordinal" => "first"
	],
	"two" => [
		"alphabet" => "b",
		"maori" => "rua",
		"roman" => "ii",
		"ordinal" => "second"
	],
	"three" => [
		"alphabet" => "c",
		"maori" => "toru",
		"roman" => "iii",
		"ordinal" => "third"
	],
	"four" => [
		"alphabet" => "d",
		"maori" => "wha",
		"roman" => "iv",
		"ordinal" => "fourth"
	]
];

$subset = ["four", "two"];

ordered = subset.map(function(v,i){
	var category = duplicate(categories[v]);
	category.append({label=v});
	return category;
});


writeDump(ordered);