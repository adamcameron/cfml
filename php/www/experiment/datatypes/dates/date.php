<?php
$datetime1 = new DateTime();
$datetime2 = new DateTime('2014-12-01');
$interval = $datetime1->diff($datetime2);
echo $interval->format('%R%a days');