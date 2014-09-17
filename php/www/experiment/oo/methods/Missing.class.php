<?php
// Missing.class.php

class Missing
{

    public function __call($name, $arguments)
    {
        require "../../../debug/dBug.php";
        new dBug(func_get_args());
    }
}
