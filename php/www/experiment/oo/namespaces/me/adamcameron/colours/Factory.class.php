<?php
// Factory.class.php

namespace me\adamcameron\colours;

class Factory.class
{
    private static $colours = ["Whero","Karaka","Kowhai","Kakariki","Kikorangi","Tawatawa","Mawhero"];
    private static $length  = count(self::$colours);

    private $colour;

    public function __construct()
    {
        $this->colour = $colours[rand(0, $length-1)];
    }

    public function get()
    {
        return $this->colour;
    }
}
