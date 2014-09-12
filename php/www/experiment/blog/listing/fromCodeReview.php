<?php
$dirBase = realpath($_SERVER["DOCUMENT_ROOT"]);

$fileSystemDir = "";

// see if there's a URL param
if (!empty($_GET['dir'])) {
    // irrespective of value, get its canonical path (which will intrinsically weed out garbage)

    $dirFromUrl = realpath($dirBase . $_GET['dir']);

    // if the result represents a dir within the website, use it...
    if (strpos($dirFromUrl, $dirBase) !== false && file_exists($dirFromUrl)){
        $fileSystemDir = $dirFromUrl;
    }
}

// ... otherwise use current
if (empty($fileSystemDir)) {
    $fileSystemDir = getcwd();
}

// we need this for making URLs, and checking to see if we offer the "parent" link
$baseRelativePath = str_replace($dirBase, "", $fileSystemDir);
$baseRelativePath = str_replace("\\", "/", $baseRelativePath);
$baseRelativePath .= "/";

// Since we make $baseRelativePath relative, a basedir check is not needed
if (is_dir($fileSystemDir)) {
    // Provide a link to go up a level
    if ($baseRelativePath != "/") {
        $parentDir = dirname($baseRelativePath);
        $parentLinkUrl = $_SERVER["SCRIPT_NAME"] . "?dir=" . $parentDir;
        echo "<a href=\"$parentLinkUrl\">[Parent Directory]</a><br>";
    }
    // and the file listing
    echo "<ul>";
    foreach (glob("$fileSystemDir\\*") as $entry) {
        // Hidden files (those starting with a dot) are not returned by glob
        $linkText = basename($entry);
        if (is_dir($entry)) {
            // We just want to link back to this file, passing the dir
            $linkUrl = $_SERVER["SCRIPT_NAME"] . "?dir=" . urlencode($baseRelativePath . basename($entry));
            $linkText .= "/"; // Just to make it more clear it's a dir
        } else {
            // we want a link to the actual file
            $linkUrl = $baseRelativePath . basename($entry);
        }
        echo "<li><a href=\"$linkUrl\">$linkText</a></li>";
    }
    echo "</ul>";
} else {
    header("HTTP/1.0 404 Not Found");
}
