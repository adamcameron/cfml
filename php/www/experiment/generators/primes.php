<?php
// primes.php

function createPrimeSequence($length=-1)
{
    $primes = [];
    $potential = 1;
    while ($length==-1 || sizeof($primes) < $length) {
        $potential++;
        $upperThreshold = sqrt($potential);
        foreach($primes as $prime){
            if ($prime > $upperThreshold){
                break;
            }
            if ($potential % $prime == 0){
                continue 2;
            }
        }
        $primes[] = $potential;
        yield end($primes);
    }
}

$primesSequence = createPrimeSequence();

for ($i=1; $i <= 20; $i++){
    echo $primesSequence->current() . " ";
    $primesSequence->next();
}

echo "<hr>";
foreach(createPrimeSequence(10) as $prime){
    echo "$prime ";
}
