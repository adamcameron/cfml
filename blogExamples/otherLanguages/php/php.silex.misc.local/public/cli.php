<?php
require_once __DIR__ . '/../vendor/autoload.php';

use Symfony\Component\HttpFoundation\Request;
use Silex\Application;

$app = new Application();

list($_, $method, $path) = $argv;

$request = Request::create($path, $method);
$app->run($request);