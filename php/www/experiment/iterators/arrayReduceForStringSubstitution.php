<?php

$template = "[article] [speed] [colour] [subject] [action] [article] [attitute] [object]"; // the quick brown fox jumps over the lazy dog
$substitutions = [
    "article"   => "the",
    "speed"     => "quick",
    "colour"    => "brown",
    "subject"   => "fox",
    "action"    => "jumps over",
    "attitute"  => "lazy",
    "object"    => "dog"
];

$translation = array_reduce($substitutions, function($translated, $){}, $template);
