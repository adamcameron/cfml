<?php
// movieWithoutDirector.php

require_once "./app.php";

$movie = new Movie("Once Were Warriors", 1994, new Person("Lee", "Tamahori"));

$serialisedMovie = serialize($movie);
echo "<pre>$serialisedMovie</pre><hr>";

$deserialisedMovie = unserialize($serialisedMovie);
echo "<pre>";
var_dump($deserialisedMovie);
echo "</pre>";
