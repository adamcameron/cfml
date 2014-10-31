<?php
// basic.php

$numbers = ["tahi","rua","toru","wha","rima","ono","whitu","waru","iwa","tekau"];

$iterator = new ArrayIterator($numbers);

while ($iterator->valid()){
    printf("%s ", $iterator->current());
    $iterator->next();
}
