<?php

$numbers = [
    "one"   => "tahi",
    "two"   => "rua",
    "three"   => "toru",
    "four"   => "wha"
];

ksort($numbers);

echo "<pre>";
var_dump($numbers);
echo "</pre><hr>";


function getNumbers()
{
    return [
        "one"   => null,
        "two"   => null,
        "three" => null,
        "four"  => null
    ];
}

$numbers = getNumbers();
ksort($numbers);

echo "<pre>";
var_dump($numbers);
echo "</pre><hr>";

class Numbers
{
    public function get()
    {
        return [
            "one"   => null,
            "two"   => null,
            "three" => null,
            "four"  => null
        ];
    }

}

$numbers = new Numbers();
$numbers = $numbers->get();
ksort($numbers);

echo "<pre>";
var_dump($numbers);
echo "</pre><hr>";


$arrayKeys = array_keys($result);
