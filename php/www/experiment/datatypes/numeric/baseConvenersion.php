<?php
$maxByteHex = "FF";
$maxBytesHex = str_repeat($maxByteHex, 12);
$maxBytesHexLen = strlen($maxBytesHex);

$maxBytesBase36 = base_convert($maxBytesHex, 16, 36);
$maxBytesBase36Len = strlen($maxBytesBase36);

$revertedToHex = base_convert($maxBytesBase36, 36, 16);

echo "\$maxBytesHex: $maxBytesHex\n";
echo "\$maxBytesHexLen: $maxBytesHexLen\n";
echo "\$maxBytesBase36: $maxBytesBase36\n";
echo "\$maxBytesBase36Len: $maxBytesBase36Len\n";
echo "\$revertedToHex: $revertedToHex\n";

