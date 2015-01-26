<?php

namespace dac\guzzledemo\providers;

use Silex\Application;
use dac\guzzledemo\services;

class UrlGeneratorServiceProvider extends \Silex\provider\UrlGeneratorServiceProvider
{
    public function register(\Silex\Application $app)
    {
        $app['url_generator'] = $app->share(function ($app) {
            $app->flush();

            return new services\UrlGenerator($app['routes'], $app['request_context']);
        });
    }
}
