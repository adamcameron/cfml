<?php
$tests = [
    [true,[1,2,3,4]],
    [true,[1,3,2,4]],
    [false,[2,1,4,3]],
    [false,[4,3,2,1]]
];

function arrayIsAlmostSorted($array) {
    $tally = 0;
    usort($array, function($e1, $e2) use (&$tally){
        if ($e1 > $e2) {
            $tally++;
        }
        return $e2 - $e1;
    });
    return $tally <= 1;
}

foreach($tests as $test){
    $expectation = $test[0];
    $testArray = $test[1];
    printf("%s => %d (Expectation: %d)%s", json_encode($testArray), arrayIsAlmostSorted($testArray), $expectation, PHP_EOL);
}
