<?php

class C {

}

function expectsObject(stdClass $object){
    echo '<hr><pre>';
    var_dump($object);
    echo '</pre>';
    return true;
}


function safeCall($task){
    try {
        $task();
    }catch (\Exception $e){
        var_dump($e);
    } finally {
        echo '<hr>';
    }
}


safeCall(function() {
    echo '<h4>Using object</h4>';
    $o = new C();
    expectsObject($o);
});


safeCall(function(){
    echo '<h4>Using array</h4>';
    expectsObject(['an array']);
});


safeCall(function() {
    echo '<h4>Using string</h4>';
    expectsObject('a string');
});
