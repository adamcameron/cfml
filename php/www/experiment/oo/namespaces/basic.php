<?php
// basic.php

require_once "app_autoload.php";

$colour = new \me\adamcameron\colours\Factory();
$colourAsString = $colour->get();
echo "Colour: $colourAsString<br>";

$day = new \me\adamcameron\days\Factory();
$dayAsString = $day->get();
echo "Colour: $dayAsString<br>";
