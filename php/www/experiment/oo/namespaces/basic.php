<?php
// basic.php

require_once "app_autoload.php";

$colour = new \me\adamcameron\colours\Factory();

echo $colour->get();
