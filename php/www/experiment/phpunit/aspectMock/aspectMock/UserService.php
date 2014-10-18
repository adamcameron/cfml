<?php
class UserService {
    function save($user){
    	echo "UserService->save() called\n";
        $user->save();
    }
}
