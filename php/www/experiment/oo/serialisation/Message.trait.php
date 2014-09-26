<?php
// Message.trait.php

trait Message
{
    public static function message($class, $function, $args)
    {
        echo sprintf("<code>%s->%s() called with arguments:<br>%s</code><br><br>", $class, $function, json_encode($args));
    }

}
