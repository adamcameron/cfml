<?php
// null.php
include "../../../../safeRun.cfm";

function numeric returnsAnInt(i) {
    return i;
}

safeRun("See what happens if we return null on an int function", function(){
    result = returnsAnInt(null);
    writeOutput("returnsAnInt(null): [#result#]<br>");
});