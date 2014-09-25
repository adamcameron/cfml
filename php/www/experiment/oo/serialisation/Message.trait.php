<?php
// Message.trait.php

trait Message
{
    public static function message($function, $args)
    {
        echo sprintf("%s() called with arguments:<br>%s<br><br>", $function, json_encode($args));
    }

}
