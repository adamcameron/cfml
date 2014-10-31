<?php
class UserService
{
    public function save($user)
    {
        echo "UserService->save() called\n";
        $user->save();
    }
}
