<?php

$a = md5('240610708'); // 0e462097431906509019562988736854
$b = md5('QNKCDZO'); //0e830400451993494058024219903391

$a = "stupid";
$b = 0;

echo "$a<br>";
echo "$b<br>";
echo "<br>";

printf("%f<br>", $a);
printf("%f<br>", $b);
echo "<br>";


var_dump($a == $b);
