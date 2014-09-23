<?php
// colours.php
require "Colours.class.php";

$colours = new Colours(["Whero","Karaka","Kowhai","Kakariki","Kikorangi","Poropango","Papura"]);

echo "<h3>while loop</h3>";
do {
    $colour = $colours->current();
    echo "$colour ";
} while ($colours->next()->valid());

echo "<hr><h3>foreach loop</h3>";
foreach ($colours as $colour){
    echo "$colour ";
}
