<?php
require __DIR__ . "/../autoload.php";

$user = new User();
$user->setName("Zachary");

$userService = new UserService();
$userService->save($user);
