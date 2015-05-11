<?php
// Person.php
namespace me\adamcameron\twig\model;

class Person {

    public $firstName;
    public $lastName;

    public function __construct($firstName, $lastName){
        $this->firstName = $firstName;
        $this->lastName = $lastName;
    }

}
