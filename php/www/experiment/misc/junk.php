<?php
function getHostEnvironment() {
	$domainPattern = '/^\w+\.\w+(.*)\.\w+$/';
    return preg_replace($domainPattern, '\1', strtolower($_SERVER['SERVER_NAME']), 1);
}

printf("Server name: %s<br>environment: %s", $_SERVER['SERVER_NAME'] , getHostEnvironment());

