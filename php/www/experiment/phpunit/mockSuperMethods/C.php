<?php
// C.php

namespace mockSuperMethods;
class C extends P {

	public function g(){
		$parentResult = parent::g();
		return "$parentResult updated by Child";
	}
	
}