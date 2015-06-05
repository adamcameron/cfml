<?php

$srcDir = __DIR__ . '\\deletefromhere.base\\';
$destDir = __DIR__ . '\\deletefromhere\\';

function createTestFilesFromBase($srcDir, $destDir){
	$umask = '0777';
	$baseDirIterator = new \RecursiveDirectoryIterator($srcDir, \FilesystemIterator::SKIP_DOTS|\FilesystemIterator::KEY_AS_FILENAME);
	$iterator = new \RecursiveIteratorIterator($baseDirIterator,\RecursiveIteratorIterator::SELF_FIRST);

	$allFiles = iterator_to_array($iterator);

	if (!file_exists($destDir)){
		mkdir($destDir, $umask, true);
	}
	foreach($iterator as $file){
		if ($iterator->isFile()){
			$destPath = $destDir . $iterator->getSubPathname();
			if ($iterator->isFile()){
				$thisDir = dirname($destPath);
				if (!file_exists($thisDir)){
					mkdir($thisDir, $umask, true);
				}
				copy($file, $destPath);
			}
		}
		
	}

}

createTestFilesFromBase($srcDir, $destDir);
sleep(5);
deleteAllFilesFromDirectory($destDir);

function deleteAllFilesFromDirectory($destDir){
	$baseDirIterator = new \RecursiveDirectoryIterator($destDir, \FilesystemIterator::SKIP_DOTS|\FilesystemIterator::KEY_AS_PATHNAME);
	$iterator = new \RecursiveIteratorIterator($baseDirIterator,\RecursiveIteratorIterator::SELF_FIRST);

	$filesArray = array_map(function($file){
		return $file->getPathname();
	}, iterator_to_array($iterator));
	rsort($filesArray);

	foreach($filesArray as $file){
		if (is_file($file)){
			unlink($file);
			continue;
		}
		rmdir($file);
	}
}


