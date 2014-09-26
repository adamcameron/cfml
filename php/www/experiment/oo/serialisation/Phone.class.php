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

}
