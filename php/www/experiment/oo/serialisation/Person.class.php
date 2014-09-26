<?php
// Person.class.php

class Person
{
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

    public static function unpackFullName($fullName)
    {
        $asArray = explode(" ", $fullName);
        return [
            "firstName" => $asArray[0],
            "lastName" => $asArray[1]
        ];
    }

}
