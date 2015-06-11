<?php
$before = [1,2,3];
$null = []['null'];

$after = 'before reset';
set_error_handler(function($errno, $errstr, $errfile, $errline){
    //return true;
    throw new ErrorException($errstr, 0, $errno, $errfile, $errline);
});
try {
    $after = array_merge($before, $null);
} catch(Exception $e){
    $copy1 = $e;
}
restore_error_handler();
try {
    $after = array_merge($before, $null);
} catch(Exception $e){
    $copy2 = $e;
}

echo '<pre>';
var_dump([
    'before'=>$before,
    'null'=>$null,
    'after'=>$after,
    'copy1'=>$copy1,
    'copy2'=>$copy2
]);
echo '</pre>';
