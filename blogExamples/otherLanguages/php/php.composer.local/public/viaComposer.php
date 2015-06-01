<?php
require __DIR__ . '\..\vendor\autoload.php';

use composertest\Message;

$o = new Message("G'day world via Composer");

echo $o->getMessage();

