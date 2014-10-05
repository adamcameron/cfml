<?php
$original = [
    ".",
    "..",
    "error_2014-09-26.log",
    "error_2014-09-27.log",
    "error_2014-09-29.log",
    "error_2014-09-30.log",
    "error_2014-10-01.log",
    "error_2014-10-02.log",
    "error_2014-10-03.log",
    "error_2014-10-04.log",
    "index.php"
];

$filtered = array_filter($original, function($entry){
    return preg_match("/\.log$/", $entry);
});

echo "<pre>";
var_dump($filtered);
echo "</pre>";