<?php

if (isset($GLOBALS['HTTP_RAW_POST_DATA'])) {
    $sData = $GLOBALS['HTTP_RAW_POST_DATA'];

    header('Content-Type: text/csv');
    header('Content-Disposition: attachment; filename=export.csv');
    header('Content-Length: ' . strlen($sData));
    header('Pragma: cache');
    header('Cache-Control: public, must-revalidate, max-age=0');
    header('Connection: close');
    header('Expires: ' . date('r', time()+60*60));
    header('Last-Modified: ' . date('r', time()));

    echo $sData;

}

?>