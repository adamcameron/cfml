<?php
// app.php

use Silex\Application;
use dac\guzzledemo\providers;

require_once __DIR__.'/../vendor/autoload.php';


$app = new Application();
$app["debug"] = true;

$app->register(new Silex\Provider\ServiceControllerServiceProvider());
$app->register(new Silex\Provider\TwigServiceProvider(), [
	"twig.path" => __DIR__.'/../src/views'
]);
$app->register(new providers\UrlGeneratorServiceProvider());


// echo "<pre>";
// print_r($app["url_generator"]);
// echo "</pre>";
// echo "<hr>";
// exit;

app\Dependencies::configure($app);
app\Routes::configure($app);

$app->run();