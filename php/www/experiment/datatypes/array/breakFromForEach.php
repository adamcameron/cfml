<?php
$numbers = range(1,10);

foreach($numbers as $number){
    echo "$number<br>";
    if ($number > 5) break;

}
