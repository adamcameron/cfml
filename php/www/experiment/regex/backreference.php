<?php
$s = "before comment <!-- within comment --> after comment";

echo preg_replace('/<!--(.*?)-->/', '$1', $s);
