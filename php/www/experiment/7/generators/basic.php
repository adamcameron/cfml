<?php
// basic.php
function getNumber(){
    foreach(['tahi', 'rua', 'toru', 'wha'] as $i){
        yield $i;
    }
}

$numbers = getNumber();

echo $numbers->current() . '<br>';
$numbers->next();

echo $numbers->current() . '<br>';
$numbers->next();

echo $numbers->current() . '<br>';
$numbers->next();

echo $numbers->current() . '<br>';
$numbers->next();

echo $numbers->current() . '<br>';
$numbers->next();

echo '<hr>';
foreach(getNumber() as $number){
    echo $number . '<br>';
}