<?php
// error.php

$dividend = $_GET["dividend"];
$divisor = $_GET["divisor"];


echo "Dividend: $dividend<br>";
echo "Divisor: $divisor<br>";

try {
    $result = $dividend / $divisor;
    echo "$dividend / $divisor = $result";

} catch (Exception $e){
    echo "Exception was caught: " . $e->getMessage();
}
