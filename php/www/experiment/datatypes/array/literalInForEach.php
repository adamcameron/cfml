<?php
$classesDir = "./classes";
$class = "Test";

forEach (["class", "interface", "trait"] as $fileType) {
	$filePath = "$classesDir/$class.$fileType.php";
	echo "$filePath<br>";
}
