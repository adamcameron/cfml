<?php
// person.php

require_once("app_autoload.php");

$boy = new Person("Zachary", "Cameron Lynch");
print_r($boy);
echo "<br>";

echo "First Name: " . $boy->firstName . "<br>";
echo "Last Name: " . $boy->lastName . "<br>";
echo "<hr>";

echo "exposed properties:<br>";
foreach($boy as $key => $value){
	echo "{$key} => {$value}<br>";
}
echo "<hr>";

echo "Full Name via accessor: " . $boy->getFullName() . "<br>";