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


$series = [600,100,100,100,600];
$expected = [100,100,100];
$result = getSubseries($series, $threshold);

$jsonExpected   = json_encode($expected);
$jsonResult     = json_encode($result);
assert($result == [100,100,100], "A multi-element series should have been found. Found: $jsonResult, expected: $jsonExpected");


$series = [600,100,100,100,600,100,100,100,100,600];
$expected = [100,100,100,100];
$result = getSubseries($series, $threshold);

$jsonExpected   = json_encode($expected);
$jsonResult     = json_encode($result);
assert($result == $expected, "A subsequent larger multi-element series should have been found. Found: $jsonResult, expected: $jsonExpected");


$series = [600,100,100,100,600,200,100,100,100,100,100,600];
$expected = [100,100,100,100,100];
$result = getSubseries($series, $threshold);

$jsonExpected   = json_encode($expected);
$jsonResult     = json_encode($result);
assert($result == $expected, "A longer adjacent subseries should be found. Found: $jsonResult, expected: $jsonExpected");


// edge cases

$series = [];
$expected = [];
$result = getSubseries($series, $threshold);

assert($result == $expected, "Works with an empty series"); // NB: passed without further changes


$series = [600,700,800,900];
$threshold = 500;
$expected = [];
$result = getSubseries($series, $threshold);

assert($result == $expected, "Works when threshold is lower than all items"); // NB: passed without further changes


$series = [50,60,70,80,90];
$threshold = 100;
$expected = [50];
$result = getSubseries($series, $threshold);

assert($result == $expected, "Works when threshold is higher than every item"); // NB: passed without further changes


$series = [50,60,70,80,90]; // 350
$threshold = 400;
$expected = [50,60,70,80,90];
$result = getSubseries($series, $threshold);

assert($result == $expected, "Works when threshold is higher than total of all items"); // NB: passed without further changes


// requirements test

$series = [100,300,100,50,50,50,50,50,500,200,100];
$threshold = 500;
$expected = [100,50,50,50,50,50];
$result = getSubseries($series, $threshold);

assert($result == $expected, "Works as per quiz requirements"); // NB: passed without further changes
