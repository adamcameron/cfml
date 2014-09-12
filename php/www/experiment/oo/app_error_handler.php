<?php
// app_error_handler.php
set_error_handler (function ($errno, $errstr, $errfile, $errline, $errcontext) {
    throw new Exception($errstr, $errno);
});
