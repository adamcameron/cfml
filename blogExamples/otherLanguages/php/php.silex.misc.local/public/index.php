<?php
// index.php
$start = microtime(true);

require_once __DIR__ . '/../vendor/autoload.php';

$app = new \me\adamcameron\misc\app\Application();
 
$app->run();
$end = microtime(true);
$diff = $end-$start;
$ms = round($diff * 1000);
echo "Execution time of empty request: {$ms}ms";