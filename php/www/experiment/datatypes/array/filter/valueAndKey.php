<?php

$numbers = ["one"=>"tahi", "two"=>"rua", "three"=>"toru", "four"=>"wha"];

array_filter($numbers, function($v,$k){
        printf("key: %s => value: %s", $k, $v);
},ARRAY_FILTER_USE_BOTH);
