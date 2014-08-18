<?php
// employee.php

require_once("app_autoload.php");

$person = new Person("Zachary", "Cameron Lynch");
echo "Name: " . $person->getFullName();

echo "<hr>";


$employee = new Employee("Donald", "Adam", "Cameron", 17);
echo "Name: " . $employee->getFullName();
echo "Employee ID: " . $employee->getEmployeeId();

echo "<hr>";