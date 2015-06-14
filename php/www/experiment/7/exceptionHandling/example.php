<?php
require __DIR__ . "/../../../../vendor/autoload.php";

class Person {}

function doSomethingToPerson(Person $x){
	return true;
}

function getPersonFromId($id){
	// mocked to conditionally return a person
	return rand(0,1) ? new Person() : null;
}
$person = getPersonFromId($_GET['id']);
try {
	$result = doSomethingToPerson($person);
	echo 'Process ran OK';
} catch(Exception $e) {
	echo 'Exception caught';
	new \dBug($e);
} catch (EngineException $e){
	echo 'EngineException caught';
	new \dBug($e);
}