<?php
// GeneralDestruct.class.php
class GeneralDestruct {
    use Message;

    function __destruct(){
        SELF::message(__CLASS__, __FUNCTION__, func_get_args());
    }
}