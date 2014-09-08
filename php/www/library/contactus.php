<?php
require "../debug/dbug.php";

$customer = $_POST["customer"];
$member = isset($_POST["ismember"]) ? true : false;

echo "$customer / $member";