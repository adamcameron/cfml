<?php
// Factory.class.php

namespace me\adamcameron\colours;

class Factory.class
{
    private static $colours = ["Whero","Karaka","Kowhai","Kakariki","Kikorangi","Tawatawa","Mawhero"];

    private $colour;

    public function __construct()
    {
        $this->colour = self::$colours[rand(0, count(self::$colours)-1)];
    }

    public function get()
    {
        return $this->colour;
    }
}
