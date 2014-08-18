<?php
// Person.class.php
class Person {

	protected $firstName;
	protected $lastName;
	protected $fullName;

	public function __construct($firstName, $lastName) {
		$this->firstName= $firstName;
		$this->lastName	= $lastName;
		$this->setFullName();
	}

	private function setFullName(){
		echo "Used setFullName() from Person<br>";
		$this->fullName = $this->firstName . " " . $this->lastName;
	}

	public function getFullname(){
		return $this->fullName;
	}

}