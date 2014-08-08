<?php
// Person.class.php
class Person {

	public $firstName;
	public $lastName;

	private $fullName;
	private $sex;

	public static $population = 0;

	const SEX_FEMALE= 0;
	const SEX_MALE	= 1;


	public function __construct($firstName, $lastName, $sex) {
		$this->firstName= $firstName;
		$this->lastName	= $lastName;
		$this->sex		= $sex;
		$this->setFullName();

		self::$population++;
	}

	private function setFullName(){
		$this->fullName = $this->firstName . " " . $this->lastName;
	}

	public function getFullname(){
		return $this->fullName;
	}

	public function getSex(){
		return $this->sex;
	}

	public function getSexAsString(){
		return $this->sex == self::SEX_FEMALE ? "female" : "male";
	}

	public static function getPopulation() {
		return self::$population;
	}

}