<?php
// Simple.class.php
class Simple {

	public function __construct($name) {
		$this->name = $name;
		echo "Constructor was called for object " . $this->name . "<br>";
	}

	function __destruct() {
		echo "Destructor was called for object " . $this->name . "<br>";
	}
	
}