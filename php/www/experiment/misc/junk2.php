<?php
$numbers=[
    ["maori"=>"tahi", "other"=>["english"=>"one"]],
    ["maori"=>"rua", "other"=>["english"=>"two"]],
    ["maori"=>"toru", "other"=>["english"=>"three"]],
    ["maori"=>"wha", "other"=>["english"=>"four"]]
];
echo "<pre>";
var_dump($numbers);
echo "</pre><hr>";


$number = array_filter($numbers, function ($number) {
        return $number["maori"] == "toru";
    });

echo "<pre>";
var_dump($number);
echo "</pre><hr>";

$first = array_shift($number);
echo "<pre>";
var_dump($first);
echo "</pre><hr>";
