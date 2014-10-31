<?php
// array_intersect_uassoc.php

$week = [
    "Monday"    => "Rāhina",
    "Tuesday"   => "Rātū",
    "Wednesday" => "Rāapa",
    "Thursday"  => "Rāpare",
    "Friday"    => "Rāmere",
    "Saturday"  => "Rāhoroi",
    "Sunday"    => "Rātapu"
];

$weekend = [
    "Saturday"  => "Rāhoroi",
    "Sunday"    => "Rātapu"
];

$weekendDays = array_intersect_uassoc($week, $weekend, function ($v1, $v2) {
    echo "$v1:$v2<br>";
    if ($v1 == $v2) return 0;
    return $v1 > $v2 ? 1 : -1;
});

echo "<pre>";
var_dump($weekendDays);
echo "</pre>";
