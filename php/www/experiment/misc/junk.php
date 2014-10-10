<?php

$testUri = "/properties/651/reviews/";

$filters = [
    ['pattern' => '/^\/properties\/\d+\/reviews/', 'handler' => ['jsonSource' => 'reviews.json', 'mock' => true]],
    ['pattern' => '/^\/properties(?!.*reviews)/', 'handler' => ['jsonSource' => 'properties.json', 'mock' => true]],
    ['pattern' => '/^\/cities/', 'handler' => ['jsonSource' => 'cities.json', 'mock' => false]],
    ['pattern' => '/^\/suggestions/', 'handler' => ['jsonSource' => 'suggestions.json', 'mock' => false]],
    ['pattern' => '/^\/currencies/', 'handler' => ['jsonSource' => 'currencies.json', 'mock' => false]],
    ['pattern' => '/^\/login/', 'handler' => ['jsonSource' => 'login.json', 'mock' => false]]
];

$filterToApply = array_filter($filters, function($filter) use ($testUri){
    return preg_match($filter["pattern"], $testUri);
});

var_dump($filterToApply);