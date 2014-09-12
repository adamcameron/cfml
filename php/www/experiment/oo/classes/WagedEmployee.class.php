<?php
// WagedEmployee.class.php

class WagedEmployee extends Employee
{
    public function __construct($firstName, $lastName, $employeeId, $hourlyRate)
    {
        parent::__construct($firstName, $lastName, $employeeId);
        $this->hourlyRate = $hourlyRate;
    }

    public function getFullName()
    {
        return $this->firstName . " " . $this->lastName;
    }

    public function getWage()
    {
        return $this->hourlyRate;
    }

}
