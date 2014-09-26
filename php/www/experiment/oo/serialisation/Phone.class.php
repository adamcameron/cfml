<?php
// Phone.class.php


class Phone
{
    use Message;

    private $country;
    private $area;
    private $number;

    public function __construct($country, $area, $number)
    {
        $this->country = $country;
        $this->area = $area;
        $this->number = $number;
    }

    public function __tostring()
    {
        return "$this->country($this->area)$this->number";
    }


    public function __sleep()
    {
        SELF::message(__CLASS__, __FUNCTION__, func_get_args());
        return ["country", "area", "number"];
    }

}
