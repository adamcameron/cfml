<?php
// dump.php

require_once __DIR__ . '/../vendor/autoload.php';

$o = new dump\C('publicProperty value', 'protectedProperty value','privateProperty value');

$v = [
    'string' => 'a string',
    'object' => $o,
    'array' => $o->getProperties()
];

new dBug($v);