<?php
// Employee.class.php

class Employee extends Person {


	public function __construct($firstName, $lastName, $employeeId) {
		$this->employeeId = $employeeId;
		parent::__construct($firstName, $lastName);
	}

	public function getEmployeeId(){
		return $this->employeeId;
	}

}