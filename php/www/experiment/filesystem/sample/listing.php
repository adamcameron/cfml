<?php
    // directory to create listing for, defaulting to the current one
    if (array_key_exists("dir", $_GET)){
        $dirCurrent = $_GET["dir"];
    }else{
        $dirCurrent = getcwd();
    }

    // sort out some baseline dirs / URLs
    $dirCurrent = realpath($dirCurrent);
    $dirBase    = realpath($_SERVER["DOCUMENT_ROOT"]);
    $urlBase    = "http://" . $_SERVER["HTTP_HOST"];

    if (strpos($dirCurrent, $dirBase) !== false && file_exists($dirCurrent)){
        // Used for building links to files
        $relativePath = str_replace($dirBase, "", $dirCurrent);
        $urlPath = str_replace("\\", "/", $relativePath);

        // provide a link to go up a level
        $parentDir = preg_replace("#[\\\/][^\\\/]+$#", "", $dirCurrent);
        $parentLinkUrl = $_SERVER["SCRIPT_NAME"] . "?dir=" . $parentDir;
        echo "<a href=\"$parentLinkUrl\">[Parent Directory]</a><br>";

        echo "<ul>";
        opendir($dirCurrent);
        while ($entry = readdir()) {
            if (in_array($entry, [".", ".."])){    // skip these two
                continue;
            }
            $linkText = $entry;
            $wholePathToFile = $dirCurrent . DIRECTORY_SEPARATOR . $entry;
            if (is_dir($wholePathToFile)){
                // we just want to link back to this file, passing the dir
                $linkUrl = $_SERVER["SCRIPT_NAME"] . "?dir=" . $wholePathToFile;
                $linkText .= "/"; // just to make it more clear it's a dir
            }else{
                // we want a link to the actual file
                $linkUrl = $urlPath . "/" . $entry;
            }
            echo "<li><a href=\"$linkUrl\">$linkText</a></li>";
        }
        closedir();
        echo "</ul>";
    }else{
        header("HTTP/1.0 404 Not Found");
    }
