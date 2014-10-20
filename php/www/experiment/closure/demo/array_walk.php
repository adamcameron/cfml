<?php
$maoriRainbow = [
    "red"       => "whero",
    "orange"    => "karaka",
    "yellow"    => "kowhai",
    "green"     => "kakariki",
    "blue"      => "kikorangi",
    "indigo"    => "kikorangi",
    "violet"    => "papura"
];
$frenchRainbow = [
    "red"       => "rouge",
    "orange"    => "orange",
    "yellow"    => "jaune",
    "green"     => "vert",
    "blue"      => "bleu",
    "indigo"    => "NO_IDEA",
    "violet"    => "NO_IDEA_EITHER"
];

$compoundRainbow = [];
array_walk($maoriRainbow, function($value, $index, $alternativeRainbow) use (&$compoundRainbow){
    $frenchColour = $alternativeRainbow[$index];
    echo "$value => $frenchColour<br>";
    $compoundRainbow[$index] = ["maori"=>$value, "french"=>$frenchColour];
}, $frenchRainbow);

echo "<pre>";
var_dump($compoundRainbow);
echo "</pre>";