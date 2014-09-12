<?php
// customException.php

require "CustomException.class.php";

try {
    throw new CustomException("CustomException Message", "CustomException Detail", -1);
}catch(Exception $e){
    echo "Message: [" . $e->getMessage() . "]<br>";
    echo "Detail: [" . $e->getDetail() . "]<br>";
    echo "Code: [" . $e->getCode() . "]<br>";
}

throw new CustomException("Unhandled CustomException Message", "Unhandled CustomException Detail", -1);
