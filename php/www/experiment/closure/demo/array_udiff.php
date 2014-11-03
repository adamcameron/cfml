<?php
$maori = [
    ["lang"=>"maori", "text"=>"iwa", "value"=>9],
    ["lang"=>"maori", "text"=>"ono", "value"=>6],
    ["lang"=>"maori", "text"=>"rua", "value"=>2],
    ["lang"=>"maori", "text"=>"wha", "value"=>4],
    ["lang"=>"maori", "text"=>"rima", "value"=>5],
    ["lang"=>"maori", "text"=>"tahi", "value"=>1],
    ["lang"=>"maori", "text"=>"toru", "value"=>3],
    ["lang"=>"maori", "text"=>"waru", "value"=>8],
    ["lang"=>"maori", "text"=>"tekau", "value"=>10],
    ["lang"=>"maori", "text"=>"whitu", "value"=>7]
];

$evens = [
    ["lang"=>"english", "text"=>"six", "value"=>6],
    ["lang"=>"english", "text"=>"ten", "value"=>10],
    ["lang"=>"english", "text"=>"two", "value"=>2],
    ["lang"=>"english", "text"=>"four", "value"=>4],
    ["lang"=>"english", "text"=>"eight", "value"=>8]
];

$tally = 0;
$maoriOdds = array_udiff($maori, $evens, function ($e1,$e2) use (&$tally) {
    $comparison = gmp_sign($e1["value"] - $e2["value"]);
    printf('(%d) $e1: %s<br>$e2: %s; comparison: %d<hr>', ++$tally, json_encode($e1), json_encode($e2), $comparison);
    return $comparison;
});

echo "<pre>";
var_dump($maoriOdds);
echo "</pre>";
