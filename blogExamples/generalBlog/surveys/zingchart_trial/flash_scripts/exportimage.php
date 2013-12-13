<?php

//print_r($GLOBALS);

//die($GLOBALS['HTTP_RAW_POST_DATA']);

if (isset($GLOBALS['HTTP_RAW_POST_DATA'])) {
    $sData = $GLOBALS['HTTP_RAW_POST_DATA'];

    //header('Content-Type: application/octet-stream');

    header('Content-Type: image/jpg');
    header('Content-Disposition: attachment; filename=image.jpg');

    /*
    header('Content-Length: ' . strlen($sData));
    header('Pragma: cache');
    header('Cache-Control: public, must-revalidate, max-age=0');
    header('Connection: close');
    header('Expires: ' . date('r', time()+60*60));
    header('Last-Modified: ' . date('r', time()));
    */

    echo $sData;

    $oImg = imagecreatefromstring($sData);
    imagegd($oImg, null, 100);
    imagedestroy($oImg);

}

?>