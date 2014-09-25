<?php

require_once "./Movie.class.php";
require_once "./Person.class.php";

$movie = new Movie("Once Were Warriors", 1994, new Person("Lee", "Tamahori"));

$serialisedMovie = serialize($movie);


echo "<pre>$serialisedMovie</pre><hr>";

$deserialisedMovie = unserialize($serialisedMovie);

require "../../../debug/dBug.php";
new dBug([get_class($deserialisedMovie), $deserialisedMovie->get()]);
