<?php
$xmlFile = __DIR__ . "\basic.xml";

$xmlRaw = file_get_contents($xmlFile);

$parser = xml_parser_create();
xml_parse_into_struct($parser, $xmlRaw, $vals, $index);


require "../../../debug/dBug.php";
new dBug(["vals"=>$vals, "index"=>$index]);

echo "<pre>";
var_dump($vals);
echo "</pre>";
echo "<pre>";
var_dump($index);
echo "</pre>";
