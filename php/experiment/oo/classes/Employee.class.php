<?php
// Employee.class.php

class Employee extends Person {


	public function __construct($firstName, $lastName, $sex, $employeeId) {
		$this->employeeId = $employeeId;
		parent::__construct($firstName, $lastName, $sex);
	}

	public function getEmployeeId(){
		return $this->employeeId;
	}

}