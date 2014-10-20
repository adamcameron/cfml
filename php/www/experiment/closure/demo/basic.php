<?php
function makeTimer($label){
    $startTime = microtime(true);
    return function($milestone) use ($label, $startTime){
        $elapsedTime = (int) (microtime(true) - $startTime) * 1000;
        return "($label: $milestone) elapsed time: {$elapsedTime}ms";
    };
}

$timer1 = makeTimer("First Timer");
echo $timer1("At start") . "<br>";

sleep(1);
$timer2 = makeTimer("Second Timer");
echo $timer2("At start, 1s after timer1") . "<br>";
echo $timer1("After 1sec") . "<br>";

sleep(1);
echo $timer2("After 1sec") . "<br>";
echo $timer1("After another second") . "<br>";


