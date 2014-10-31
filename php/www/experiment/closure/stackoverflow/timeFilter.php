<?php
$embargoPeriods = [
    ["from" => "10:00:00", "to" => "10:30:00"],
    ["from" => "11:00:00", "to" => "11:45:00"],
    ["from" => "14:00:00", "to" => "15:00:00"],
    ["from" => "16:30:00", "to" => "17:00:00"]
];

$potentialAppointments = [
    ["from" => "09:30", "to" => "10:00"], // good
    ["from" => "10:15", "to" => "10:45"],
    ["from" => "11:00", "to" => "11:30"],
    ["from" => "11:45", "to" => "12:15"], // good
    ["from" => "12:30", "to" => "13:00"], // good
    ["from" => "13:15", "to" => "13:45"], // good
    ["from" => "14:00", "to" => "14:30"],
    ["from" => "14:45", "to" => "15:15"],
    ["from" => "15:30", "to" => "16:00"], // good
    ["from" => "16:15", "to" => "16:45"],
    ["from" => "17:00", "to" => "17:30"], // good
    ["from" => "17:45", "to" => "18:15"], // good
    ["from" => "18:30", "to" => "19:00"], // good
    ["from" => "19:15", "to" => "19:45"] // good
];


$validAppointments = array_udiff($potentialAppointments, $embargoPeriods, function ($slot1, $slot2) {
    $entirelyBefore = strtotime($slot1["to"]) <= strtotime($slot2["from"]);
    $entirelyAfter = strtotime($slot1["from"]) >= strtotime($slot2["to"]);
    $entirelyWithin = strtotime($slot1["from"]) >=strtotime($slot2["from"]) && strtotime($slot1["to"]) <= strtotime($slot2["to"]);

        echo "<pre>";
        //var_dump([$slot1, $slot2, $entirelyBefore,  $entirelyAfter]);
        echo "</pre><hr>";

    if ($entirelyBefore) return -1;
    if ($entirelyAfter || $entirelyWithin) return 1;
    return 0;
});

echo "<br><br><pre>";
var_dump($validAppointments);
echo "</pre>";


/*
 $validAppointments = array_udiff($potentialAppointments, $embargoPeriods, function ($slot1, $slot2) {
        $overlapsAtStart =  strtotime($slot1["from"]) < strtotime($slot2["from"]) && strtotime($slot1["to"]) > strtotime($slot2["from"]);
        $overlapsAtEnd =  strtotime($slot1["from"]) >= strtotime($slot2["from"]) && strtotime($slot1["from"]) <= strtotime($slot2["to"]);


    if ($overlapsAtStart) return -1;
    if ($overlapsAtEnd) return 1;
        //if ($entirelyWithin) return 1;
    return 0;
});
 */
