<?php
require "Usable.php";

abstract class AbstractUsable implements Usable {

	public function needsThisMethod(){
		return true;
	}

	public abstract function alsoNeedsThisMethod();

}