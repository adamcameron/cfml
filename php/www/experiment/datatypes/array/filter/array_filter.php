<?php
// array_filter.php

require "../../../debug/dBug.php";

$a = [
    [
        1 => "a",
        2 => "b",
        3 => "c",
        4 => "d",
        5 => "e"
    ],
    [
        6 => "f",
        7 => "g",
        8 => "h",
        9 => "i",
        10 => "j"
    ]
];


function findChunks($array, $key)
{
    return array_filter($array, function ($subArray) use ($key) {
        return array_key_exists($key, $subArray);
    });
}

$chunks = findChunks($a, 10);
var_dump($chunks);



new dBug($chunks);
