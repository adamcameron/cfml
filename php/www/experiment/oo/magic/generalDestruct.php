<?php
// generalDestruct.php
require_once("./app.php");

echo "Before creation<br>";
$obj = new GeneralDestruct();
echo "After creation<br>";
$obj = null;
echo "After assigning to null<br>";
