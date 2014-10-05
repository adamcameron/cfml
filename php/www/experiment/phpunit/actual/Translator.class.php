<?php

class Translator {

    public static function translate($key, $language){
        return sprintf("%s_%s", $language,$key);
    }
}