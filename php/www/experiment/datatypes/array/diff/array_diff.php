<?php
$numbers = ["tahi", "rua", "toru", "wha"];
$evens = ["rua", "wha"];

$odds = array_diff($numbers, $evens);

echo json_encode($odds);

$rainbow = [
    "red"=>"Whero",
    "RED"=>"WHERO",
    "orange"=>"Karaka",
    "yellow"=>"Kowhai",
    "green"=>"Kakariki",
    "blue"=>"Kikorangi",
    "indigo"=>"Poropango",
    "purple"=>"Papura"
];

$primary = [
    "RED"=>"Whero",
    "green"=>"Kakariki",
    "blue"=>"KIKORANGI"
];

$diff = array_diff($rainbow, $primary);

echo json_encode($diff);
