<?php
require "Person.class.php";

$person = new Person();
$person->firstName = "Donald";
$firstName = $person->firstName;
echo "First name: $firstName<br>";
echo "<hr>";


if (!isset($person->lastName)){
    $person->lastName = "Cameron";
}
$lastName = $person->lastName;
echo "Last name: $lastName<br>";
unset($person->lastName);
echo "<hr>";

$person->middleName = "Adam";
$middleName = $person->middleName;
echo "Middle name: $middleName<br>";
echo "<hr>";

$person->sex = "Male";
$sex = $person->sex;
echo "Sex: $sex<br>";
