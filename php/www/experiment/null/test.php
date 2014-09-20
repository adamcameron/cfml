<?php
// test.php

$tests = [
	"null == 0",
	"null >= 0",
	"null <= 0",
	"null > 0",
	"null < 0",
	"null == 1",
	"null == -1",
	"null == true",
	"null == false",
	"null === false"
];

foreach ($tests as $test) {
	echo "$test<br>";
	$statement = "\$result = $test;";
	eval($statement);
	if ($result){
		echo "you're having a laugh, PHP<br>";
	}else{
		echo "well that's a relief<br>";
	}
	echo "<hr>";
}
