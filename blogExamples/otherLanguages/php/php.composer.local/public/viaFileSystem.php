<?php
// viaFileSystem.php

require __DIR__ . '\..\vendor\dac\composertest\src\Message.php';

$o = new composertest\Message("G'day World via file system");

echo $o->getMessage();