<?php
// Logger.php

namespace dac\guzzledemo\services;

class Logger {

	private $start;

	public function __construct(){
		$this->start = time();
	}

	public function getElapsed($message){
		error_log(sprintf("%s: %d", $message, time() - $this->start));
	}
	
}