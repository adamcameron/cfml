<?php
$a = 'help';

$result = preg_match('[^help](.*)', $a, $match,PREG_OFFSET_CAPTURE);

require "../debug/dBug.php";

new dBug([$result, $match]);
