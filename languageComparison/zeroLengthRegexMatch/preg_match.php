<?php
// preg_grep.php
$input = $_GET["input"] ?: "";
$pattern = "/^\\d*$/";
$match = preg_match($pattern, $input);
echo "input: " . $input . "<br>";
echo "match: " . $match . "<br>";
?>