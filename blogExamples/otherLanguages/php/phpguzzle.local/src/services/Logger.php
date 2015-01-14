<?php
// Logger.php

namespace dac\guzzledemo\services;

class Logger {

	private $start;

	public function __construct(){
		$this->start = microtime(true);
	}

	public function getElapsed($message){
		error_log(sprintf("%s: %f", $message, microtime(true) - $this->start));
	}
	
	public function logTaskTime($message, $job){
		error_log(sprintf("BEFORE: %s: %f", $message, microtime(true) - $this->start));
		$job();
		error_log(sprintf("AFTER: %s: %f", $message, microtime(true) - $this->start));
	}

}