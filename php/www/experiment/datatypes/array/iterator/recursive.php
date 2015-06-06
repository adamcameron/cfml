<?php

$WizardA = [
    'aForm1' => [
        'title' => 'Tester',
        'phone' => '555-555-5555',
        'address' => '123 Any Street, Any Town, TX 77840',
        'where_at' => '666'
    ],
    'aForm2' => [
        'needComputer' => 'Yes',
        'needEmail' => 'Yes'
    ]
];

$WizardB = [
    'aForm1' => [
        'title' => 'Tester',
        'phone' => '555-555-5555',
        'address' => '123 Any Street, Any Town, TX 77840',
        'where_at' => '666'
    ],
    'aForm2' => [
        'needComputer' => 'Yes',
        'needEmail' => 'Yes'
    ]
];

$WizardC = [
    'foo' => 'bar',
    42    => 24,
    'multi' => [
        'dimensional' => [
            'array' => 'foo'
        ]
]
];


function findValueOfKey($needle, $aHaystack) {
    $it = new RecursiveIteratorIterator(new RecursiveArrayIterator($aHaystack));
    $a = iterator_to_array($it);
    return $a[$needle];
}


echo findValueOfKey('where_at', $WizardA) . "\n";
echo findValueOfKey('where_at', $WizardB) . "\n";
echo findValueOfKey('array', $WizardC) . "\n";
echo findValueOfKey('42', $WizardC) . "\n";