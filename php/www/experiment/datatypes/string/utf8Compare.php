<?php
$s1 = 'é';
$s2 = 'z';
$op = $s1 < $s2;
$comp = strcmp($s1, $s2);

setlocale(LC_COLLATE, "fr_FR.UTF8");

echo "<pre>";
var_dump ([$op, $comp]);
echo "</pre>";
