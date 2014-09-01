<?php
// wagedEmployee.php

require_once("app_autoload.php");

$wagedEmployee = new WagedEmployee("Zachary", "Cameron Lynch", 1001, 100.00);

echo "ID: " . $wagedEmployee->getEmployeeId() . "<br>";
echo "Full name: " . $wagedEmployee->getFullName() . "<br>";
echo "Hourly rate: " . $wagedEmployee->getWage() . "<br>";