<?php

$first = ['tahi', 'rua', 'toru', 'wha', 'rima'];
$second = ['ono', 'whitu', 'waru', 'iwa', 'tekau'];
$merged = array_merge($first, $second);
dump($merged);

$empty = [];
$merged = array_merge($first, $empty);
dump($merged);

$missing = []['missing'];
$merged = array_merge($first, (array)$missing);
dump($merged);


function dump($val){
	echo '<pre>';
	var_dump($val);
	echo '</pre><hr>';
}