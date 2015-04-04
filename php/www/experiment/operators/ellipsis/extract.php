<?php
$numbers = ['one'=>'tahi','two'=>'rua','three'=>'toru','four'=>'wha'];
extract($numbers);
var_dump([$one,$two,$three,$four]);

$colours = ['whero','karaka','kowhai','kakariki','kikorangi','poropango','papura'];
extract($colours, EXTR_PREFIX_ALL, 'colour');
var_dump([$colour_0,$colour_6]);
