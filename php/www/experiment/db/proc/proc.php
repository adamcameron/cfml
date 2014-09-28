<?php
require_once "../../../debug/dBug.php";

$low = $_GET["low"];
$high = $_GET["high"];

$dbConn = new mysqli("localhost", "scratch", "scratch", "scratch");

$dbConn->multi_query("CALL getSampleData($low,$high,@tally);SELECT @tally as tally");

do {
	if ($rs=$dbConn->store_result()){
		new dBug($rs->fetch_all());
		echo "<hr>";
	}
} while($dbConn->more_results() && $dbConn->next_result());

