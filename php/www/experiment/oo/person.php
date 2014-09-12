<?php
// person.php

require_once("app.php");

$boy = new Person("Zachary", "Cameron Lynch");
echo "Name: " . $boy->getFullName() . "<br>";
echo "Population: " . Person::getPopulation();
echo "<hr>";

$dad = new Person("Adam", "Cameron");
echo "Name: " . $dad->getFullName() . "<br>";
echo "Population: " . Person::getPopulation();
echo "<hr>";

$grandDad = new Person("Donald", "Cameron");
echo "Name: " . $grandDad->getFullName() . "<br>";
echo "Population: " . Person::$population;
echo "<hr>";
