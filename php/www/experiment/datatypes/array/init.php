<?php

$lang = 'en';
$type = 'map';

$a = [];

$a[$lang][$type][] = 'G\'day';
$a[$lang][$type][] = 'World';

echo '<pre>';
var_dump($a);
echo '</pre>';