<?php
// CustomException.class.php

class CustomException extends Exception {

	public function __construct($message, $detail, $code = 0, Exception $previous = null) {
		$this->detail = $detail;

		parent::__construct($message, $code, $previous);
	}

	public function getDetail(){
		return $this->detail;
	}

	public function __toString(){
		return "CustomException as a string ($this->code)";
	}

}