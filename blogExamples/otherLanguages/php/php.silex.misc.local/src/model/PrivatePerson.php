<?php
// PrivatePerson.php
namespace me\adamcameron\misc\model;

class PrivatePerson extends Person {

    function __debugInfo(){
        return get_object_vars($this);
    }
}