<?php

class Translator
{
    public function translate($key, $language)
    {
        return sprintf("%s_%s", $language,$key);
    }
}
