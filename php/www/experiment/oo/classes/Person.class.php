<?php
// Person.class.php
class Person {

	protected $firstName;
	protected $lastName;

	public function __construct($firstName, $lastName) {
		$this->firstName= $firstName;
		$this->lastName	= $lastName;
	}

	public function getFullname(){
		return $this->firstName . " " . $this->lastName;
	}

}