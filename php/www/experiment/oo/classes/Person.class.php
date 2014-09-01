<?php
// Person.class.php
abstract class Person {

	protected $firstName;
	protected $lastName;
	protected $fullName;

	public function __construct($firstName, $lastName) {
		$this->firstName= $firstName;
		$this->lastName	= $lastName;
	}

	abstract public function getFullName();

}