<?php
$baseDir = __DIR__ . '\\resources\\';

$dir_iterator = new RecursiveDirectoryIterator($baseDir, FilesystemIterator::SKIP_DOTS|FilesystemIterator::KEY_AS_FILENAME);
$iterator = new RecursiveIteratorIterator($dir_iterator,RecursiveIteratorIterator::SELF_FIRST);

$files = [];
foreach ($iterator as $file) {
	if ($iterator->isFile()){
		$files[] = ['file'=>$file, 'subPath'=>$iterator->getSubPath()];
	}
}
echo '<pre>';
var_dump($files);
echo '</pre>';
