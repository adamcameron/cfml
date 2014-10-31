<?php
// UserServiceTest.php

use AspectMock\Test as test;

class UserTest extends \PHPUnit_Framework_TestCase
{
    protected function tearDown()
    {
        test::clean(); // remove all registered test doubles
    }

    public function testUserCreate()
    {
        $userProxy = test::double('User', ['save' => function () {
            echo "MOCKED User->save() called\n";
        }]);
        $service = new UserService;
        $user = $service->createUserByName('Zachary');

        $this->assertEquals('Zachary', $user->getName());
        $userProxy->verifyInvoked('save');
    }

}
