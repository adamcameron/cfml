<?php
// outputStringContainingChr7.php
$bell = chr(7);
$s = $bell . "foo$bell";

echo "{$s}:" . strlen($s) . ":" . ord(substr($s, 0));
?>