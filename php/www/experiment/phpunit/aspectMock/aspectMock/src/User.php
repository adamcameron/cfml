<?php
// User.php

class User
{
    private $name;

    public function __construct() { if (($__am_res = __amock_before($this, __CLASS__, __FUNCTION__, array(), false)) !== __AM_CONTINUE__) return $__am_res;
        echo "User->__construct() called\n";
    }

    public function setName($name) { if (($__am_res = __amock_before($this, __CLASS__, __FUNCTION__, array($name), false)) !== __AM_CONTINUE__) return $__am_res;
        echo "User->setName() called\n";
        $this->name = $name;
    }

    public function getName() { if (($__am_res = __amock_before($this, __CLASS__, __FUNCTION__, array(), false)) !== __AM_CONTINUE__) return $__am_res;
        echo "User->getName() called\n";
        return $this->name;
    }

    public function save() { if (($__am_res = __amock_before($this, __CLASS__, __FUNCTION__, array(), false)) !== __AM_CONTINUE__) return $__am_res;
        echo "User->save() called (WE DO NOT WANT TO SEE THIS)\n";
    }
}
