<?php
// use.php

require "me/adamcameron/numbers/Factories.class.php";

use me\adamcameron\numbers\maori,
    me\adamcameron\numbers\english\Factory as EnglishFactory;

$maoriNumber = new maori\Factory();
$maoriNumberAsString = $maoriNumber->get();
echo "Maori number: $maoriNumberAsString<br>";

$englishNumber = new EnglishFactory();
$englishNumberAsString = $englishNumber->get();
echo "English number: $englishNumberAsString<br>";
