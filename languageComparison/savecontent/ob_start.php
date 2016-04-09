<?php
ob_start();
echo "Some text" . PHP_EOL;
if (rand(0,1)){
    $result = "value if true";
}else{
    $result = "and if it's false";
}
echo $result . PHP_EOL;
echo "Message from include is: ";
include __DIR__ . "\inc.php";

echo ob_get_clean();