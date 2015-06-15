<?php
namespace dac;

class ComposerTest {

	private $message;

	public function __construct($message){
		$this->message = $message;
	}
	
	public function getMessage(){
		return $this->message;
	}

}