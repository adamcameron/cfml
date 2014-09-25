<?php
function createPrimeSequence()
{
    $primes = [];
    $potential = 1;
    while (true) {
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

for ($i=1; $i <= 10001; $i++){
    echo $primesSequence->current() . "<br>";
    $primesSequence->next();
}
