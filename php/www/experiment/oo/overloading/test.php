<?php
require "Person.class.php";

$person = new Person();
$person->firstName = "Donald";

if (!isset($person->lastName)){
    $person->lastName = "Cameron";
}

$firstName = $person->firstName;
$lastName = $person->lastName;

echo "Full name: $firstName $lastName<br>";

unset($person->firstName);
unset($person->lastName);

echo "<hr>";

$person->middleName = "Adam";
$middleName = $person->middleName;
