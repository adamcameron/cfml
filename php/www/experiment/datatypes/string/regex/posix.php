<?php
$id = uniqid();

$okPattern = "/^[[:xdigit:]]{13}$/";
$badPattern = "/^[[:xdigit:]]{14}$/";

$okResult = preg_match($okPattern, $id);
$badResult = preg_match($badPattern, $id);

echo "<pre>";
var_dump([
    "id"            => $id,
    "okPattern"     => $okPattern,
    "badPattern"    => $badPattern,
    "okResult"      => $okResult,
    "badResult"     => $badResult
]);
echo "</pre>";
