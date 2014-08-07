<?php
// testEmployee.php

require_once("app_autoload.php");

$adam = new Employee("Adam", "Cameron");
echo "Name: " . $adam->getFullName() . "<br>";
echo "Sex: " . $adam->getSex() . "<br>";
echo "Population: " . Employee::getPopulation();
echo "<hr>";

require_once("../debug/dBug.php");
new dBug($adam);