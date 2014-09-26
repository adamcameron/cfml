<?php
// phone.php

require_once "./app.php";

$phone = new Phone("+44","020", "12345678");

echo "<pre>";
var_dump($phone);
echo "</pre>";