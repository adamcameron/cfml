<?php
require __DIR__ . '\..\vendor\dac\composertest\Message.php';

$o = new composertest\Message("G'day World via file system");

echo $o->getMessage();