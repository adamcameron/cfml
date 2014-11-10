<?php
// GetSubseriesTest.php

assert_options(ASSERT_CALLBACK, function ($script, $line, $expression, $message) {
    printf("(%d) %s\n", $line, $message);
    exit;
});


require "getSubseries.php";

$series = [100,300,100,50,50,50,50,50,500,200,100];
$threshold = 500;

$result = getSubseries($series, $threshold);
assert(is_array($result), "Should return an array");

// this test passed initially, so was not the "next" test that should have been made
$sum = array_sum($result);
assert($sum <= $threshold, "Total of array elements ($sum) should be no more than the threshold ($threshold)");

// this is a valid second test
$length = count($result);
assert($length > 0, "For a threshold which should return values, the subseries should contain elements");
