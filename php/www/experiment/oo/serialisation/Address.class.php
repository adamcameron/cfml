<?php
// Address.class.php

class Address
{
    use Message;

    private $address;
    private $city;
    private $country;

    private $phone;

    public function __construct($address, $city, $country, $phone)
    {
        foreach(func_get_args() as $name=>$value){
            echo "$name:  $value<br>";
            $this->$name = $value;
        }
    }

    public function __sleep()
    {
        SELF::message(__FUNCTION__, func_get_args());
        return ["address", "city", "country", "phone"];
    }

    public function __wakeup()
    {
        SELF::message(__FUNCTION__, func_get_args());
    }

    public function get()
    {
        return [
            "address" => $this->address,
            "city"  => $this->city,
            "country" => $this->country,
            "phone" => $this->phone
        ];
    }

}
