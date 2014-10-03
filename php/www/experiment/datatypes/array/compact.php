<?php
$city  = "San Francisco";
$state = "CA";
$event = "SIGGRAPH";

$location_vars = array("city", "state");

$numbers = ["one"=>"tahi", "two"=>"rua", "three"=>"toru", "four"=>"wha"];

$result = compact("event", "nothing_here", $location_vars, "numbers");

echo "<pre>";
var_dump($result);
echo "</pre><hr>";
extract($result, EXTR_PREFIX_ALL, "extracted");
echo "<pre>";
var_dump([$extracted_city,$extracted_state,$extracted_event,$extracted_numbers]);
echo "</pre>";
