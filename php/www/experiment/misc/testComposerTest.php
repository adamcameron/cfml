<?php
require __DIR__ . '/ComposerTest.php';

$composerTest = new \dac\ComposerTest("G'day World");

echo $composerTest->getMessage();