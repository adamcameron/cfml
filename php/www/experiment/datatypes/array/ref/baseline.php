<?php
//baseline.php

$array1 = array(1,20);
$x = &$array1[1];
$array2 = $array1;
$array2[1] = 22;
print_r($array1[1]); // Output is 22
