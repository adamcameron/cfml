<?php
    $dirCurrent = '';
    if (!empty($_GET['dir'])) {
        $dirCurrent = trim($_GET['dir'], '/');
    }

    $dirBase = realpath($_SERVER["DOCUMENT_ROOT"]);

    $testDir = $dirBase . '/' . $dirCurrent;
    $realPath = realpath($testDir);

    echo '$dirBase: ' . $dirBase . "<br>";
    echo '$dirCurrent: ' . $dirCurrent . "<br>";
    echo '$testDir: ' . $testDir . "<br>";
    echo '$realPath: ' . $realPath . "<br>";
    echo 'is_dir($testDir)' . is_dir($testDir) . "<br>";
