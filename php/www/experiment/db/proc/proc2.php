<?php
require_once "../../../debug/dBug.php";

$low = $_GET["low"];
$high = $_GET["high"];

$dbConn = new mysqli("localhost", "scratch", "scratch", "scratch");

$dbConn->multi_query("CALL getSampleData($low,$high,@tally);SELECT @tally as tally");

$rs=$dbConn->store_result();
echo "<pre>";
var_dump($rs->fetch_object());
var_dump($rs->fetch_object());
var_dump($rs->fetch_object());
var_dump($rs->fetch_object());
echo "</pre>";
echo $dbConn->more_results();
