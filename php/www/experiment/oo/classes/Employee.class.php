<?php
// Employee.class.php

class Employee extends Person {

	protected $middleName;
	protected $employeeId;

	public function __construct($firstName, $lastName, $middleName, $employeeId) {
		$this->middleName = $middleName;
		$this->employeeId = $employeeId;
		parent::__construct($firstName, $lastName);
	}


	public function getEmployeeId(){
		return $this->employeeId;
	}

	public function getFullname(){
		return $this->firstName . " " . $this->middleName . " " . $this->lastName;
	}

}