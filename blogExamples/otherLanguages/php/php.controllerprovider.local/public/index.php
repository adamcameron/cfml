<?php
// index.php

require_once __DIR__ . '/../vendor/autoload.php';

$app = new \me\adamcameron\controllerprovider\app\Application();
 
$app->run();