<?php
//numbers.php
require "Numbers.class.php";
require "../../debug/dBug.php";

echo "<h3>before populated</h3>";
$numbers = new Numbers();
echo sprintf("valid(): %b<br>", $numbers->valid());

echo "<hr><h3>after adding one</h3>";
$numbers->push("one", "tahi");
echo sprintf("valid(): %b<br>", $numbers->valid());
echo sprintf("key(): %d<br>", $numbers->key());

echo "<hr><h3>after adding 2-4</h3>";
$numbers    -> push("two", "rua")
            -> push("three", "toru")
            -> push("four", "wha");
echo sprintf("valid(): %b<br>", $numbers->valid());
echo sprintf("key(): %d<br>", $numbers->key());
echo "current()";
new dBug($numbers->current());

echo "<hr><h3>after rewind()</h3>";
$numbers->rewind();
echo sprintf("key(): %d<br>", $numbers->key());
echo sprintf("valid(): %b<br>", $numbers->valid());

echo "<hr><h3>while loop</h3>";
while ($numbers->valid()){
    $number = $numbers->current();
    echo sprintf("English: %s; Maori: %s<br>", $number["english"], $number["maori"]);
    $numbers->next();
}

echo "<hr><h3>foreach loop</h3>";
foreach ($numbers as $number){
    echo sprintf("English: %s; Maori: %s<br>", $number["english"], $number["maori"]);
}
