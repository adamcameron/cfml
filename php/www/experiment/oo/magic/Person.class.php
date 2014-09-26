<?php
// Person.class.php

class Person{

    use Message;

    private $firstName;
    private $lastName;

    function __construct($firstName, $lastName){
        $this->firstName = $firstName;
        $this->lastName = $lastName;
    }

    function __invoke(){
        SELF::message(__CLASS__, __FUNCTION__, func_get_args());
        return [
            "firstName" => $this->firstName,
            "lastName" => $this->lastName
        ];
    }
}