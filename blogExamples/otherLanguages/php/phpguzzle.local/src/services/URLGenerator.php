<?php
// URLGenrator.php


namespace dac\guzzledemo\services;

use Symfony\Component\Routing\Generator;

class UrlGenerator extends Generator\UrlGenerator
{

    public function generateTranslationAwareUrl($name, $parameters = array()){
        $thisRoute = $this->routes->get($name);
        $options = $thisRoute->getOptions();

        $suffix = "";
        if (array_key_exists("requiresTranslation", $options)){
            $suffix = "?requiresTranslation=" . ($options["requiresTranslation"] ? "true" : "false");
        }

        return $this->generate($name, $parameters, self::ABSOLUTE_PATH) . $suffix;
    }
}
