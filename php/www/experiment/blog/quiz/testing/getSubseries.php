<?php
// getSubseries.php


/*

function getSubseries() {}


function getSubseries()
{
	return [];
}


function getSubseries($series, $threshold)
{
    $subseries = [];
    array_walk($series, function ($value) use ($threshold, &$subseries) {
        if ($value <= $threshold){
            $subseries = [$value];
        }
    });
    return $subseries;
}


function getSubseries($series, $threshold)
{
    $subseries = [];
    array_walk($series, function ($value) use ($threshold, &$subseries) {
        if (array_sum($subseries) + $value <= $threshold){
            $subseries[] = $value;
        }
    });
    return $subseries;
}


function getSubseries($series, $threshold)
{
    $subseries  = [];
    $working    = [];
    array_walk($series, function ($value) use ($threshold, &$subseries, &$working) {
            if ($value > $threshold) {
                $working = [];
            }elseif (array_sum($working) + $value <= $threshold){
                $working[] = $value;
            }

            if (count($working) > count($subseries)){
                $subseries = $working;
            }
        });
    return $subseries;
}


function getSubseries($series, $threshold)
{
    $subseries  = [];
    $working    = [];
    array_walk($series, function ($value) use ($threshold, &$subseries, &$working) {
        if ($value > $threshold) {
            $working = [];
        }elseif (array_sum($working) + $value <= $threshold){
            $working[] = $value;
        }elseif(array_sum($working) + $value - $working[0] <= $threshold) {
            array_shift($working);
            $working[] = $value;
        }

        if (count($working) > count($subseries)){
            $subseries = $working;
        }
    });
    return $subseries;
}


function getSubseries($series, $threshold)
{
    $subseries  = [];
    $working    = [];
    array_walk($series, function ($value) use ($threshold, &$subseries, &$working) {
        if (array_sum($working) + $value <= $threshold){
            $working[] = $value;
        }elseif(count($working) && array_sum($working) + $value - $working[0] <= $threshold) {
            array_shift($working);
            $working[] = $value;
        }else{
            $working = [];
        }

        if (count($working) > count($subseries) || (count($working) == count($subseries) && array_sum($working) > array_sum($subseries))){
            $subseries = $working;
        }
    });
    return $subseries;
}
*/

function getSubseries($series, $threshold)
{
    $subseries  = [];
    $working    = [];
    array_walk($series, function ($value) use ($threshold, &$subseries, &$working) {
            if (array_sum($working) + $value <= $threshold){
                $working[] = $value;
            }elseif(count($working) && array_sum($working) + $value - $working[0] <= $threshold) {
                array_shift($working);
                $working[] = $value;
            }else{
                $working = [];
            }
            if (count($working) < count($subseries)){
                return;
            }

            if (count($working) > count($subseries)){
                $subseries = $working;
                return;
            }

            if (array_sum($working) > array_sum($subseries)){
                $subseries = $working;
                return;
            }
        });
    return $subseries;
}
