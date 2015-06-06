<?php
// steppedFileScan.php
$baseDir = __DIR__ . '\\resources\\';
$locales = ['de_DE','en_GB','es_ES','it_IT','pt_BR'];


function getFiles($baseDir, $locales){
	foreach ($locales as $locale) {
		$resourceDir = $baseDir . $locale . '\\';
		$files = glob($resourceDir . '*.txt');
		yield $files;
	}
}

foreach(getFiles($baseDir, $locales) as $files){
	var_dump($files);
}