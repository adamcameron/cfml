<?php
// getSubseries.php



//function getSubseries() {}

/*
function getSubseries()
{
	return [];
}
*/

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
