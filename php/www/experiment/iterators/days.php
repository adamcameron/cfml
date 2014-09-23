<?php
// days.php
require "Days.class.php";

$days = new Days(["Rāhina","Rātū","Rāapa","Rāpare","Rāmere","Rāhoroi","Rātapu"]);

echo "<hr><h3>foreach loop</h3>";
foreach ($days as $key=>$value){
    echo "$key ";
}
