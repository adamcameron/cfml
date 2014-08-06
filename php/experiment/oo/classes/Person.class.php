<?php
// Person.class.php
class Person {

	public $firstName;
	public $lastName;
	private $fullName;


	public function __construct($firstName, $lastName) {
		$this->firstName = $firstName;
		$this->lastName = $lastName;
		$this->setFullName();
	}

	private function setFullName(){
		$this->fullName = $this->firstName . " " . $this->lastName;
	}

	public function getFullname(){
		return $this->fullName;
	}

}