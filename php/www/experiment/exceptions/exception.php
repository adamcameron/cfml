<?php
// exception.php
try {
    throw new Exception("Exception Message");
}catch(Exception $e){
    echo "Message: [" . $e->getMessage() . "]<br>";
    echo "Code: [" . $e->getCode() . "]<br>";
    echo "File: [" . $e->getFile() . "]<br>";
    echo "Line: [" . $e->getLine() . "]<br>";
    echo "Trace: [" . $e->getTraceAsString() . "]<br>";
}finally{
    echo "After try/catch have completed<br>";
}
