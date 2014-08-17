<?php
	$dir = realpath("./sample");
	echo "<h2>Directory:</h2>";
	echo "$dir<br><hr>";

	echo "<h2>readdir():</h2>";
	opendir($dir);
	while ($entry = readdir()) {
		echo "$entry<br>";
	}
	// dir handle being implicitly closed @ end of request is OK
	echo "<hr>";

	echo "<h2>glob():</h2>";
	foreach (glob("$dir\\*") as $entry) {
		echo "$entry<br>";
	}
	echo "<hr>";

	echo "<h2>RecursiveDirectoryIterator:</h2>";
	$dirIterator = new RecursiveIteratorIterator(new RecursiveDirectoryIterator($dir));
    $dirIterator->next();
	while($dirIterator->valid()) {
	    echo $dirIterator->key() . "<br>";
	    $dirIterator->next();
	}
	echo "<hr>";

	echo "<h2>scandir():</h2>";
	$files = scandir($dir);
	foreach ($files as $entry){
		echo "$entry<br>";
	}
	echo "<hr>";

	echo "<h2>GlobIterator():</h2>";
	$globIterator = new GlobIterator("$dir/*");
	foreach ($globIterator as $entry){
		echo $entry->getFilename() . "<br>";
	}
	echo "<hr>";
?>