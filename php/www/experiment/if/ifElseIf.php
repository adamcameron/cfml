<?php
// ifElseIf.php

$test = isset($_GET["test"]) ? $_GET["test"] : 0;

function process($message, &$number){
    echo "<h3>$message</h3>";
    echo "It started as $number<br>";
    $number++;
    echo "It's now $number<br>";
}

if ($test == 1){
    process("if()", $test);
} else if($test == 2){
    process("else if()", $test);
}elseif($test == 3){
    process("elseif()", $test);
}else{
    process("else", $test);
}

