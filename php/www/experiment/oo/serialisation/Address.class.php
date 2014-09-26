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
        $this->address = $address;
        $this->city = $city;
        $this->country = $country;
        $this->phone = $phone;
    }

    public function __sleep()
    {
        SELF::message(__CLASS__, __FUNCTION__, func_get_args());
        return ["address", "city", "country", "phone"];
    }

    public function __wakeup()
    {
        SELF::message(__CLASS__, __FUNCTION__, func_get_args());
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
