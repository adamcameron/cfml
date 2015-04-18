<?php
// index.php

require_once __DIR__ . '/../vendor/autoload.php';

$app = new \me\adamcameron\asyncguzzle\app\Application();
 
$app->run();