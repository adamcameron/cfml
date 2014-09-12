<?php
// inheritance.php

require_once("app_autoload.php");

$person = new Person("Zachary", "Cameron Lynch");
echo $person->getFullName() . "<br>";
echo "<hr>";

$employee = new Employee("Donald", "Adam", "Cameron", 17);
echo $employee->getFullName() . "<br>";
echo "<hr>";
