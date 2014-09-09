<?php
// Logging.trait.php
trait Logging {

	static private $LOG_FILE = "C:/temp/dummy.log";

	static function logToFile($text){
		$ts = date("c");
		error_log("$ts $text\r\n", 3, SELF::$LOG_FILE);
	}
	
	static function logToScreen($text){
		echo "LOG: $text<br>";
	}
}