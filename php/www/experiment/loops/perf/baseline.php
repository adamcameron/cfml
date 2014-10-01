<?php
// baseline.php

$size = isset($_GET["size"]) ? $_GET["size"] : 1;

function getSize($size){
	return $size;
}

$timeJob = function($message, $job) {
	$start = microtime(true);
	$job();
	$end = microtime(true);
	$duration = (int)(($end - $start) * 1000);
	echo sprintf("%s: %sms<br>", $message, $duration);
};

echo "<h3>Running $size iterations</h3>";

$timeJob("Baseline (ascending)", function() use ($size){
	for ($i=1; $i < getSize($size); $i++){
		$b = $i;
	}
});

$timeJob("Using variable for length (ascending)", function() use ($size){
	$iterations = getSize($size);
	for ($i=0; $i < $iterations; $i++){
		$b = $i;
	}
});

$timeJob("Post decrement (descending)", function() use ($size){
	for ($i=getSize($size); $i--;){
		$b = $i;
	}
});

$timeJob("Pre decrement (descending)", function() use ($size){
	for ($i=getSize($size); --$i;){
		$b = $i;
	}
});

$timeJob("Pre decrement with additional operation (descending)", function() use ($size){
for ($i=getSize($size); --$i;){
	$b = $i;
	$c = $i;
}
});
