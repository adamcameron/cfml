<?php
// employee.php

require_once("app_autoload.php");

$adam = new Employee("Adam", "Cameron", Employee::SEX_MALE, 17);
echo "ID: " . $adam->getEmployeeId() . "<br>";
echo "Name: " . $adam->getFullName() . "<br>";
echo "Sex: " . $adam->getSexAsString() . "<br>";
echo "<hr>";

require_once("../debug/dBug.php");
new dBug($adam);