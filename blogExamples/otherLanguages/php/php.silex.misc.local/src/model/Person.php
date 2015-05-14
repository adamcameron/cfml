<?php
// Person.php
namespace me\adamcameron\misc\model;

class Person{

    private $firstName;
    private $lastName;
    public $fullName;

    function __construct($firstName, $lastName){
        $this->firstName = $firstName;
        $this->lastName = $lastName;
        $this->fullName = "$firstName $lastName";
    }
}