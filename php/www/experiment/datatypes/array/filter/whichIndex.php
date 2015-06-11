<?php

$numbers = ['tahi', 'rua', 'toru', 'wha'];

$three = array_filter($numbers, function($number){
	return $number == 'toru';
});
echo '<pre>';
var_dump($three);
echo '</pre><hr>';
echo '<pre>';
var_dump(array_shift($three));
echo '</pre><hr>';