<?php
// Person.class.php

class Person
{
    use Message;

    private $firstName;
    private $lastName;

    public function __construct($firstName, $lastName)
    {
        $this->firstName = $firstName;
        $this->lastName = $lastName;
    }

    public function getFullName()
    {
        return "$this->firstName $this->lastName";
    }

    public function __sleep()
    {
        SELF::message(__CLASS__, __FUNCTION__, func_get_args());
        return ["firstName", "lastName"];
    }

    public function __wakeup()
    {
        SELF::message(__CLASS__, __FUNCTION__, func_get_args());
    }

}
