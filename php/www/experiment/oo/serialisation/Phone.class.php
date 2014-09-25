<?php
// Phone.class.php


class Phone
{
    private $country;
    private $area;
    private $number;

    public function __construct($country, $area, $number)
    {
        foreach(func_get_args() as $name=>$value){
            echo "$name:  $value<br>";
            $this->$name = $value;
        }
    }

    public function __tostring()
    {
        return "$this->country($this->area)$this->number";
    }
}
