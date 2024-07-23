<?php
// outputStringContainingChr0.php
$null = chr(0);
$s = $null . "foo$null";

echo "{$s}:" . strlen($s) . ":" . ord(substr($s, 0));
?>