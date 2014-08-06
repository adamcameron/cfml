<?php
// Person.class.php
class Person {

	public $firstName;
	public $lastName;
	private $fullName;

	public static $population = 0;


	public function __construct($firstName, $lastName) {
		$this->firstName = $firstName;
		$this->lastName = $lastName;
		$this->setFullName();

		self::$population++;
	}

	private function setFullName(){
		$this->fullName = $this->firstName . " " . $this->lastName;
	}

	public function getFullname(){
		return $this->fullName;
	}

	public static function getPopulation() {
		return self::$population;
	}

}