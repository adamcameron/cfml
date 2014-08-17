<?php
	$integerVariable	= 123;
	$stringVariable	= "123";

	$array = array(
		"integerVariable" 	=> $integerVariable,
		"stringVariable"	=> $stringVariable,
		"hardCodedString"	=> "123",
		"hardCodedInteger"	=> 123,
		"strval()"			=> strval($integerVariable)
	);
	$json = json_encode($array);

	echo $json;
?>