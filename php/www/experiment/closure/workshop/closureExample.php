<?php
function makeTimer($name)
{
    $startTime = microtime(true);
    return function ($milestone) use ($name, $startTime) {
        $currentElapsedTime = microtime(true) - $startTime;
        return sprintf("%s (%s): %dms\n", $name, $milestone, $currentElapsedTime * 1000);
    };
};

$firstTimer = makeTimer("Timer 1");
echo $firstTimer("started");
sleep(1);

$secondTimer = makeTimer("Timer 2");
echo $secondTimer("started");

echo $firstTimer("after Timer 2 started");

sleep(1);
echo $firstTimer("a coupla seconds later");
sleep(1);
echo $secondTimer("at the end");
