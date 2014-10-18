<?php

$rainbow = ["whero","karaka","kowhai","kakariki","kikorangi","poropango","papura"];
echo "<pre>";
echo json_encode($rainbow);
var_dump($rainbow);
echo "</pre>";
echo "<hr>";

$containsK = array_filter($rainbow, function($colour){
	return strpos($colour, "k") !== false;
});
echo "<pre>";
echo json_encode($containsK);
var_dump($containsK);
echo "</pre>";
echo "<hr>";

$green = array_filter($rainbow, function($colour){
    return $colour == "kakariki";
});
echo "<pre>";
echo json_encode($green);
var_dump($green);
echo "</pre>";
echo "<hr>";
