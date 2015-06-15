<?php
//require_once 'C:\webroots\shared\composertest\ComposerTest.php';
require_once __DIR__ . '/../../../vendor/autoload.php';

$o = new ComposerTest('lalal');
echo $o->getMessage();