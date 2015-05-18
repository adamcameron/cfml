<?php
// cli.php
require_once __DIR__ . '/../vendor/autoload.php';

list($_, $method, $path) = $argv;

$app = new \me\adamcameron\misc\app\Application();

$request = \Symfony\Component\HttpFoundation\Request::create($path, $method);
$app->run($request);

