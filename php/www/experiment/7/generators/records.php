<?php
// records.php

const QUARTER_SEC = 250000;
const HALF_SEC = 500000;

$recordCount = $_GET['count'] ? $_GET['count'] : 10;

$range = range(1, $recordCount);

$records = getRecords();

$start = microtime(true);

foreach($range as $i){
    $records->next();
    $record = $records->current();
    $elapsed = round((microtime(true) - $start) * 1000);
    echo "$record fetched @ {$elapsed}ms <br>";
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
        usleep(QUARTER_SEC);
        yield $recordValue;
    }
    yield from loadArchivedRecords();
}

function loadArchivedRecords(){
    $archivedRecordCount = 10;
    foreach(range(1,$archivedRecordCount) as $recordIndex){
        $recordValue = "Archive record #$recordIndex";
        usleep(HALF_SEC);
        yield $recordValue;
    }
    yield from loadArchivedRecords();
}
