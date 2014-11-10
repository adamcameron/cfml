<?php
// getSubseries.php



//function getSubseries() {}

/*
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
*/

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
