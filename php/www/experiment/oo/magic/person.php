<?php
// person.php

require_once("./app.php");

$person = new Person("Zachary", "Cameron Lynch");

$result = $person();

new dBug($result);
