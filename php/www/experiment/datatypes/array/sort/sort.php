<?php
$arr = ['0-3 months', '9-12 months', '3-6 months', '6-9 months', '12-18 months', '18-24 months'];
print_r($arr);
echo "\n\n\n";
sort($arr, SORT_NUMERIC);
print_r($arr);
