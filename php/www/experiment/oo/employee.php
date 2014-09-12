<?php
// employee.php

require_once("app_autoload.php");

$person = new Person("Zachary", "Cameron Lynch");
echo "Class: " . get_class($person) . "<br>";
echo "Name: " . $person->getFullName();

echo "<hr>";


$employee = new Employee("Donald", "Adam", "Cameron", 17);
echo "Class: " . get_class($employee) . "<br>";
echo "Name: " . $employee->getFullName() . "<br>";
echo "Employee ID: " . $employee->getEmployeeId();

echo "<hr>";
