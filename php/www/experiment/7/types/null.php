<?php
function returnNull(): int {
    return null;
}

try {
$result = returnNull();
echo "returnNull(): [$result]<br>";
} catch (Exception $e){
    echo 'Caught Exception<pre>';
    var_dump($e);
    echo '</pre>';
} catch (EngineException $e){
    echo 'Caught EngineException<pre>';
    var_dump($e);
    echo '</pre>';
}