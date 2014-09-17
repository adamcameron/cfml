<?php
function f()
{
    echo sprintf("Using __FUNCTION__: %s() called<br>", __FUNCTION__);
}
runkit_function_copy('f', 'g');
f();
g();
