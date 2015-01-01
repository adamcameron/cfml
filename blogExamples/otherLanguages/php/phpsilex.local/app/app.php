<?php
// app.php

use Silex\Application;

require_once __DIR__.'/../vendor/autoload.php';


$app = new Application();
$app["debug"] = true;

require_once __DIR__.'/routes.php';

$app->run();
