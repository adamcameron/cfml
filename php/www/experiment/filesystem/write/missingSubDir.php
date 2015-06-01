<?php
$subdir = __DIR__ . '\\someSubDir\\';
$fileToWrite = $subdir . 'fileToWrite.txt';
$content = 'G\'day world!';


if(!file_exists(dirname($fileToWrite))) {
    mkdir(dirname($fileToWrite), 0777, true);
}
file_put_contents($fileToWrite, $content);