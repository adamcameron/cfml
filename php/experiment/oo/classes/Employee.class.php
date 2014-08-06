<?php
// Employee.class.php

class Employee extends Person {

	const SEX_NOT_SPECIFIED = -1;

	public function __construct($firstName, $lastName, $dateOfBirth=null, $sex=null) {
		$args = func_get_args();
		if (!isset($dateOfBirth)){
			$dateOfBirth = null;
		}
		if (!isset($sex)){
			$sex = Employee::SEX_NOT_SPECIFIED;
		}

		parent::__construct($firstName, $lastName, $dateOfBirth, $sex);
	}

	public function __destruct (){	// nb: needs to be public, apparently
		echo $this->getFullName() . " destroyed";
	}

	public function getSex(){
		return parent::_getSex() ? "Female" : "Male";
	}

}