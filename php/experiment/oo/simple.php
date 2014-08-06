<?php
// simple.php
require_once("app_autoload.php");

$first = new Simple("First Object");
echo "<hr>";

$second = new Simple("Second Object");
$second = null;
echo "<hr>";