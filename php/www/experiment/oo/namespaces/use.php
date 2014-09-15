<?php
// use.php

require "me/adamcameron/numbers/Factories.class.php";

use me\adamcameron\numbers\maori as maori;

$maoriNumber = new maori\Factory();
$maoriNumberAsString = $maoriNumber->get();
echo "Maori number: $maoriNumberAsString<br>";

use me\adamcameron\numbers\english\Factory as EnglishFactory;

$englishNumber = new EnglishFactory();
$englishNumberAsString = $englishNumber->get();
echo "English number: $englishNumberAsString<br>";
