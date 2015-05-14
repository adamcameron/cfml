<?php
// PrivatePerson.php
namespace me\adamcameron\misc\model;

class PrivatePerson extends Person {

    function __debugInfo(){
        return call_user_func('get_object_vars', $this);
    }
}