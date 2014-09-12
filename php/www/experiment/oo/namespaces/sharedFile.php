<?php
// sharedFile.php

require "me/adamcameron/numbers/Factories.class.php";

$maoriNumber = new \me\adamcameron\numbers\maori\Factory();
$maoriNumberAsString = $maoriNumber->get();
echo "Maori number: $maoriNumberAsString<br>";

$englishNumber = new \me\adamcameron\numbers\english\Factory();
$englishNumberAsString = $englishNumber->get();
echo "English number: $englishNumberAsString<br>";
