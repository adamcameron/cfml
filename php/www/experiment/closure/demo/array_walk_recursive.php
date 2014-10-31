<?php
$words = [
    "colours"   => [
        "red"   => [
            "fr"    => "rouge",
            "mi"    => "whero"
        ],
        "green"   => [
            "fr"    => "vert",
            "mi"    => "kakariki"
        ],
        "blue"   => [
            "fr"    => "bleu",
            "mi"    => "kikorangi"
        ]
    ],
    "numbers"   => [
        ["de" => "ein", "mi" => "tahi"],
        ["de" => "zwei", "mi" => "rua"],
        ["de" => "drei", "mi" => "toru"],
        ["de" => "vier", "mi" => "wha"]
    ],
    "week"      => ["Rāhina","Rātū","Rāapa","Rāpare","Rāmere","Rāhoroi","Rātapu"]
];

array_walk_recursive($words, function ($value, $index) {
    $valueAsJson = json_encode($value);
    echo "$index: $valueAsJson<br>";
});
