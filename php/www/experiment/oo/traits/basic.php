<?php
require_once "../app_autoload.php";

$home =  new Address("56 Mulberry Way", "E18 1ED", "United Kingdom");
$homeAsXml =  $home->toXml();

echo htmlspecialchars($homeAsXml);
