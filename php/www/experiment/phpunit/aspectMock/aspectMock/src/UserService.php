<?php
// UserService.php

class UserService
{
    public function createUserByName($name) { if (($__am_res = __amock_before($this, __CLASS__, __FUNCTION__, array($name), false)) !== __AM_CONTINUE__) return $__am_res;
        echo "UserService->createUserByName() called\n";

        $user = new User();
        $user->setName($name);
        $user->save();

        return $user;
    }
}
