<?php
// Directory to create listing for, defaulting to the current one
if (!empty($_GET['dir'])) {
    // Remove leading and trailing slashes
    $dirCurrent = trim($_GET['dir'], '/');
}else{
	$dirCurrent = getcwd();
}


$dirBase = realpath($_SERVER["DOCUMENT_ROOT"]);

// Since we make $dirCurrent relative, a basedir check is not needed
if (is_dir($dirBase . '/' . $dirCurrent)) {
    // Provide a link to go up a level
    if (!empty($dirCurrent)) {
        $parentDir = dirname($dirCurrent);
        $parentLinkUrl = $_SERVER["SCRIPT_NAME"] . "?dir=" . $parentDir;
        echo "<a href=\"$parentLinkUrl\">[Parent Directory]</a><br>";
    }
    echo "<ul>";
    foreach (glob("$dirBase/$dirCurrent/*") as $entry) {
        // Hidden files (those starting with a dot) are not returned by glob
        $linkText = $entry;
        if (is_dir("$dirBase/$dirCurrent/$entry")) {
            // We just want to link back to this file, passing the dir
            $linkUrl = $_SERVER["SCRIPT_NAME"] . "?dir=" . urlencode("$dirCurrent/$entry");
            $linkText .= "/"; // Just to make it more clear it's a dir
        } else {
            // we want a link to the actual file
            $linkUrl = "$dirCurrent/$entry";
        }
        echo "<li><a href=\"$linkUrl\">$linkText</a></li>";
    }
    echo "</ul>";
} else {
    header("HTTP/1.0 404 Not Found");
}
?>