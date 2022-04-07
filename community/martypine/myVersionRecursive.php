<?php

// myVersionRecursive.php

$tree = [
	["id"=>1, "left"=>1, "right"=>28],
		["id"=>2, "left"=>2, "right"=>17],
			["id"=>3, "left"=>3, "right"=>10],
				["id"=>4, "left"=>4, "right"=>5],
				["id"=>5, "left"=>6, "right"=>7],
				["id"=>6, "left"=>8, "right"=>9],
			["id"=>7, "left"=>11, "right"=>16],
				["id"=>8, "left"=>12, "right"=>13],
				["id"=>9, "left"=>14, "right"=>15],
		["id"=>10, "left"=>18, "right"=>27],
			["id"=>11, "left"=>19, "right"=>22],
				["id"=>12, "left"=>20, "right"=>21],
			["id"=>13, "left"=>23, "right"=>26],
				["id"=>14, "left"=>24, "right"=>25]
];


function convertNestedSetToAdjacencyList($tree, $node=null, $parent=[]){
	$node = $node ?? $tree[0];
	$nextChildLeft = $node["left"] + 1;

	$children = array_filter($tree, function($node) use (&$nextChildLeft) {
		if ($node["left"] != $nextChildLeft){
			return false;
		}
		$nextChildLeft = $node["right"] + 1;
		return true;
	});
	$children = array_values($children); // because array_filter() sux

	$result = [
		"id" => $node["id"],
		"parent" => $parent
	];

	$result["children"] = array_map(function($child) use ($tree, $result){
		return convertNestedSetToAdjacencyList($tree, $child, $result);
	}, $children);

	return $result;
}

$adjacencyList = convertNestedSetToAdjacencyList($tree);

var_dump($adjacencyList);

$node14GrandParent = $adjacencyList["children"][1]["children"][1]["children"][0]["parent"]["parent"];

var_dump($node14GrandParent["id"]);
