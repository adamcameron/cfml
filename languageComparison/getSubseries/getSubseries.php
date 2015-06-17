<?php
// getSubseries.php

$series = [100,300,100,50,50,50,50,50,500,200,100];
$threshold = 500;

$subseries = getSubseries1($series, $threshold);

print_r($subseries);

function getSubseries1($series, $threshold)
{
    $subseries = [];
    $working = [];
    array_walk($series, function ($value) use ($threshold, &$subseries, &$working) {
        if ($value > $threshold){
            $working = [];
        } elseif (array_sum($working) + $value <= $threshold){
            $working[] = $value;
        }elseif(array_sum($working) + $value - $working[0] <= $threshold){
            array_shift($working);
            $working[] = $value;
        }else{
            $working = [$value];
        }
        if (count($working) > count($subseries)){
            $subseries = $working;
        }
    });
    return $subseries;
}

function getSubseries2($series, $threshold)
{
    $subseries = [];
    $working = [];
    array_walk($series, function ($value) use ($threshold, &$subseries, &$working) {
        $working[] = $value;
        if (array_sum($working) <= $threshold) {
            return $subseries = count($working) > count($subseries) ? $working : $subseries;
        }
        array_shift($working);
    });
    return $subseries;
}

function getSubseries3($series, $threshold)
{
    $subseries = [];
    $working = [];
    foreach ($series as $value){
        $working[] = $value;
        if (array_sum($working) <= $threshold) {
            $subseries = count($working) > count($subseries) ? $working : $subseries;
            continue;
        }
        array_shift($working);
    }
    return $subseries;
}

function getSubseries4($series, $threshold)
{
    $working = [];
    return array_reduce($series, function ($reduction, $current) use ($threshold, &$working) {
        $working[] = $current;
        if (array_sum($working) <= $threshold) {
            return count($working) > count($reduction) ? $working : $reduction;
        }
        array_shift($working);
        return $reduction;
    }, []);
}
