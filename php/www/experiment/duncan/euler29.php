<?php
ini_set('max_execution_time', 100);

$lower = 2;
$upper = 100;

$start = microtime(true);
$numbers = [];

for ($i = $lower; $i <= $upper; $i++) {
    for ($j = $lower; $j <= $upper; $j++) {
        $x = bcpow($i, $j);

        $newNumbers = array_flip($numbers);

        if (!isset($newNumbers[$x])) {
            $numbers[] = $x;
        }
    }
}
echo count($numbers);

$finish = microtime(true);
$executionTime = ($finish - $start) * 1000;
printf ("\nExecution time: %dms\n", $executionTime);


echo "\n=================\n\n";

$start = microtime(true);
$numbers = [];
$range = range($lower,$upper);

foreach($range as $i){
    foreach($range as $j){
        $x = bcpow($i, $j);
        $numbers[$x] = true;
    }
}
echo count($numbers);

$finish = microtime(true);
$executionTime = ($finish - $start) * 1000;
printf ("\nExecution time: %dms\n", $executionTime);


echo "\n=================\n\n";

$start = microtime(true);
$range = range($lower,$upper);

$numbers = array_reduce($range, function($reduction, $i) use ($range){
    $numbers = array_reduce($range, function($reduction, $j) use ($i){
        $reduction[] = bcpow($i, $j);
        return $reduction;
    },[]);
    return array_merge($reduction, $numbers);
}, []);
echo count(array_unique($numbers));

$finish = microtime(true);
$executionTime = ($finish - $start) * 1000;
printf ("\nExecution time: %dms\n", $executionTime);


echo "\n=================\n\n";