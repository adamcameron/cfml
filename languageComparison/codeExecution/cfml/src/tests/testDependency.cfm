<?php
writeOutput("#getCurrentTemplatePath()# read<br>");

require_once __DIR__ . '/../../other/Dependency.php';

$dependency = new \other\Dependency();

var_dump($dependency);
