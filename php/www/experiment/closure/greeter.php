<?php
// greeter.php

$makeGreeter = function ($greeting) {
    return function ($name) use ($greeting) {
        return "$greeting, $name";
    };
};

$greetInIrish = $makeGreeter("howdy");
echo sprintf("In Irish: %s<br>", $greetInIrish('Zachary'));

$greetInMaori = $makeGreeter("Kia ora");
echo sprintf("In Maori: %s<br>", $greetInMaori('Adam'));
