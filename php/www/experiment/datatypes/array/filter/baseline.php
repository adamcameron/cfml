<?php

$rainbow = ["whero","karaka","kowhai","kakariki","kikorangi","poropango","papura"];

$green = array_filter($rainbow, function($colour){
	return $colour == "kakariki";
});

echo json_encode($green);