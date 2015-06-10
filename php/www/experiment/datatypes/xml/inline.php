<?php

function varDumpHtml($object) {
    echo '<hr><pre>';
    var_dump($object);
    echo '</pre><hr>';
}

$rawXml = <<<XML
<?xml version='1.0' standalone='yes'?>
<aaa>
<bbb ccc="ddd" eee="fff">ggg</bbb>
<bbb ccc="hhh" iii="jjj">kkk</bbb>
</aaa>
XML;

$xml = new SimpleXMLElement($rawXml);

varDumpHtml($xml);


$ccc = (string) $xml->bbb[0]['ccc'];
varDumpHtml($ccc);