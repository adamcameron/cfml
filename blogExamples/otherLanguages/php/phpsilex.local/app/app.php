<?php
// app.php

use Silex\Application;

require_once __DIR__.'/../vendor/autoload.php';


$app = new Application();
$app["debug"] = true;

$app->register(new Silex\Provider\TwigServiceProvider(), [
	"twig.path" => __DIR__.'/../src/views'
]);

require_once __DIR__.'/routes.php';

$app->run();
