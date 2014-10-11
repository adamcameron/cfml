<?php
$letters = ["2"=>"B","4"=>"D","8"=>"H"];

$merge = array_merge_recursive([], $letters);

echo "<pre>";
var_dump($merge);
echo "</pre>";