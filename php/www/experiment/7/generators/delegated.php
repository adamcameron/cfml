<?php
// delegated.php

function getWords(){
    foreach (['tahi','rua', 'toru', 'wha', 'rima', 'ono', 'whitu', 'waru', 'iwa', 'tekau'] as $number){
        yield $number;
    }
    yield from getColours();
}

function getColours(){
    foreach (['whero','karaka', 'kowhai', 'kakariki', 'kikorangi', 'poropango', 'papura'] as $colour){
        yield $colour;
    }
}

foreach(getWords() as $word){
    echo "$word<br>";
}