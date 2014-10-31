<?php
// cormac.php

$data =[
    "first" => [
        ["code" => "_1_E", "text" => "one", "notNeeded"=>"_1_one"],
        ["code" => "_1_M", "text" => "tahi", "notNeeded"=>"_1_tahi"]
    ],
    "second" => [
        ["code" => "_2_E", "text" => "two", "notNeeded"=>"_2_two"],
        ["code" => "_2_M", "text" => "rua", "notNeeded"=>"_2_rua"]
    ],
    "third" => [
        ["code" => "_3_E", "text" => "three", "notNeeded"=>"_3_three"],
        ["code" => "_3_M", "text" => "toru", "notNeeded"=>"_3_toru"]
    ],
    "fourth" => [
        ["code" => "_4_E", "text" => "four", "notNeeded"=>"_4_four"],
        ["code" => "_4_M", "text" => "wha", "notNeeded"=>"_4_wha"]
    ]
];
$dataOriginal = $data;

foreach($data as $name=>$translationSet){
    $translationSet = array_map(function ($translation) {
        return ["code" => $translation["code"], "text" => $translation["text"]];
    }, $translationSet);

    $translationSet = array_reduce($translationSet, function ($result, $element) {
        $result[$element["code"]] = $element["text"];
        return $result;
    }, []);
    $data[$name] = $translationSet;
}

echo "<pre>";
var_dump($dataOriginal);
echo "<hr>";
var_dump($data);
echo "</pre>";
