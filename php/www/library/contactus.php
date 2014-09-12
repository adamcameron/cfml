<?php
require "../debug/dbug.php";

$customeremail = $_POST["customeremail"];
$replywanted = isset($_POST["replywanted"]) ? true : false;

echo "$customeremail / $replywanted";
