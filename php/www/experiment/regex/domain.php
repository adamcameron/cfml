<?php
$domain = $_GET["domain"];

$domainPattern = "/^\w+\.\w+(.*)\.\w+$/";

$matches = [];
preg_match($domainPattern, $domain, $matches);

$envPart = $matches[1];

printf("[%s]", $envPart); // de.hostelbookers.adam.cameron.dev1.ch.hostelworld.com => [.adam.cameron.dev1.ch.hostelworld]; www.hostelbookers.com => []