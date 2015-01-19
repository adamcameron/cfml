<?php
require "AbstractUsable.php";

class IsUsable extends AbstractUsable {

	public function alsoNeedsThisMethod(){
		return true;
	}

}