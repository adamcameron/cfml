<?php
require "Person.class.php";

$person = new Person();
$person->firstName = "Zachary";

if (!isset($person->lastName)){
    $person->lastName = "Cameron Lynch";
}

$firstName = $person->firstName;
$lastName = $person->lastName;

echo "Full name: $firstName $lastName<br>";

unset($person->firstName);
unset($person->lastName);
