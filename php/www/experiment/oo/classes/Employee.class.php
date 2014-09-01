<?php
// Employee.class.php

abstract class Employee extends Person {

	protected $employeeId;

	public function __construct($firstName,$lastName, $employeeId) {
		parent::__construct($firstName, $lastName);
		$this->employeeId = $employeeId;
	}

	public function getEmployeeId(){
		return $this->employeeId;
	}

}