<?php
$crossRef = [
    "whero"     => "red",
    "karaka"    => "orange",
    "kowhai"    => "yellow",
    "kakariki"  => "green",
    "kikorangi" => "blue",
    "poropango" => "indigo",
    "papura"    => "violet"
];

$main = [
    "red"       => 3,
    "orange"    => 6,
    "yellow"    => 6,
    "green"     => 5,
    "blue"      => 4,
    "indigo"    => 6,
    "violet"    => 6
];

$ok = [
    "whero"     => 1,
    "kakariki"  => 2,
    "kikorangi" => 3
];

$diff = array_diff_ukey($main, $ok, function($key1, $key2) use ($crossRef){
    $existsInCrossRef = array_key_exists($key2, $crossRef);
    $matchesCrossRef = $existsInCrossRef && $crossRef[$key2] == $key1;
    return !$matchesCrossRef;
});

echo "<pre>";
var_dump($diff);
echo "</pre>";