<?php
// records.php

$range = range(1, $_GET['count']);

$records = getRecords();

foreach($range as $i){
    $records->next();
    echo $records->current() . "<br>";
}


function getRecords(){
    $preloadedRecords = array_map(function($i){ return "Preloaded record #$i";}, range(0,10));
    foreach ($preloadedRecords as $record){
        yield $record;
    }
    yield from loadOnlineRecords();
}

function loadOnlineRecords(){
    $nearlineRecordCount = 10;
    foreach(range(1,$nearlineRecordCount) as $recordIndex){
        $recordValue = "Nearline record #$recordIndex";
        yield $recordValue;
    }
    yield from loadArchivedRecords();
}

function loadArchivedRecords(){
    $archivedRecordCount = 10;
    foreach(range(1,$archivedRecordCount) as $recordIndex){
        $recordValue = "Arvhive record #$recordIndex";
        yield $recordValue;
    }
    yield from loadArchivedRecords();
}
