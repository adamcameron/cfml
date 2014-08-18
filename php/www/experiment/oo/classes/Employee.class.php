<?php
// Employee.class.php

class Employee extends Person {

	protected $middleName;
	protected $employeeId;

	public function __construct($firstName, $middleName, $lastName, $employeeId) {
		$this->middleName = $middleName;
		$this->employeeId = $employeeId;
		parent::__construct($firstName, $lastName);
	}

	private function setFullName(){
		echo "Used setFullName() from Employee<br>";
		$this->fullName = $this->firstName . " " . $this->middleName . " " . $this->lastName;
	}

	public function getEmployeeId(){
		return $this->employeeId;
	}

}