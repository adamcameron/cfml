 <?php
// Person.php
class Person {
	public $firstName;
	public $lastName;
	public $dateOfBirth;

	const SEX_MALE = 0;
	const SEX_FEMALE = 1;

	public static $population = 0;

	public function __construct($firstName, $lastName, $dateOfBirth, $sex) {
		$this->setFirstName($firstName);
		$this->setLastName($lastName);
		$this->setDateOfBirth($dateOfBirth);
		$this->setSex($sex);

		self::$population++;
	}

	public function getFullName() {
		return $this->firstName . " " . $this->lastName;
	}

	public static function getPopulation() {
		return self::$population;
	}

	public function setFirstName($firstName) {
		$this->firstName = $firstName;
		return $this;
	}

	public function setLastName($lastName) {
		$this->lastName = $lastName;
		return $this;
	}

	public function setDateOfBirth($dateOfBirth) {
		$this->dateOfBirth = $dateOfBirth;
		return $this;
	}

	public function setSex($sex) {
		$this->sex = $sex;
		return $this;
	}

}
?>
