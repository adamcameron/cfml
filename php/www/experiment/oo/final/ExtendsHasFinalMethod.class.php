<?php

require "HasFinalMethod.class.php";

class ExtendsHasFinalMethod extends HasFinalMethod
{
    public function isFinalised()
    {
        return true;
    }
}
