<?php
$classesDir = "./classes";
$class = "Test";

foreach (["class", "interface", "trait"] as $fileType) {
    $filePath = "$classesDir/$class.$fileType.php";
    echo "$filePath<br>";
}
