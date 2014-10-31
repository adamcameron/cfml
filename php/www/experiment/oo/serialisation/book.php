<?php

require_once "app.php";

$book = new Book("Dead Babies", "Martin Amis");

$serialisedBook = serialize($book);

echo "<pre>";
var_dump($serialisedBook);
echo "</pre>";
