<?php
// Child.php

class Child extends Parent {

	public function g(){
		$parentResult = parent::g();
		return "$parentResult updated by Child";
	}
	
}