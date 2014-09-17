<?php
// Missing.class.php

require "../../../debug/dBug.php";

class Missing
{

    public function __call($name, $arguments)
    {
        echo sprintf("Function called: %s", __FUNCTION__);
        new dBug(func_get_args());
    }

    public static function __callStatic($name, $arguments)
    {
        echo sprintf("Function called: %s", __FUNCTION__);
        new dBug(func_get_args());
    }
}
