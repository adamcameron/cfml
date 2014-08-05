<?php
// testPerson.php

require_once("../debug/dBug.php");
require_once("app_autoload.php");

$boy = new Person("Zachary", "Cameron Lynch", new DateTime("2011-03-24"), Person::SEX_MALE);
echo "Name: " . $boy->getFullName() . "<br>";
echo "Population: " . Person::getPopulation();
echo "<hr>";


$dob = new DateTime();
$dob->setDate(1970,2,17);
$dad = new Person("Adam", "Cameron", $dob, Person::SEX_MALE);
echo "Name: " . $dad->getFullName() . "<br>";
echo "Population: " . Person::getPopulation();
echo "<hr>";

$mum = new Person("", "", "", "");
$mum->setFirstName("Nollaig");
$mum->setLastName("Lynch");
$mum->setDateOfBirth(new DateTime("1968-12-20"));
$mum->setSex(Person::SEX_FEMALE);
echo "Name: " . $mum->getFullName() . "<br>";
echo "Population: " . Person::getPopulation();
echo "<hr>";

$grandDad = (new Person("", "", "", ""))->setFirstName("Donald")->setLastName("Cameron")->setDateOfBirth(new DateTime("1933-02-20"))->setSex(Person::SEX_MALE);


echo "Name: " . $grandDad->getFullName() . "<br>";
echo "Population: " . Person::getPopulation();
echo "<hr>";

new dBug($grandDad);
?>