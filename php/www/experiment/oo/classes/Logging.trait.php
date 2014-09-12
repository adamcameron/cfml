<?php
// Logging.trait.php
trait Logging
{
    private static $LOG_FILE = "C:/temp/dummy.log";

    public static function logToFile($text)
    {
        $ts = date("c");
        error_log("$ts $text\r\n", 3, SELF::$LOG_FILE);
    }

    public static function logToScreen($text)
    {
        echo "LOG: $text<br>";
    }
}
