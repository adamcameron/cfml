<?php
class User {
	private $name;

	function __construct(){
		echo "User->__construct() called\n";
	}

	function setName($name){
		echo "User->setName() called\n";
		$this->name = $name;
	}

	function getName(){
		echo "User->getName() called\n";
		return $this->name;
	}

	function save(){
		echo "User->save() called\n";
	}
}