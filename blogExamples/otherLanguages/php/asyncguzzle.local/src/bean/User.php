<?php
// User.php
namespace me\adamcameron\asyncguzzle\bean;

class User {

	protected $id;
	protected $firstName;
	protected $lastName;

	function __construct($id, $firstName, $lastName){
		$this->id = $id;
		$this->firstName = $firstName;
		$this->lastName = $lastName;
	}

	function getId(){
		return $this->id;
	}

	function getFirstName(){
		return $this->firstName;
	}

	function getLastName(){
		return $this->lastName;
	}

}