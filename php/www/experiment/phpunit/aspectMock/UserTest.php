<?php
use AspectMock\Test as test;

require "User.php";

class UserTest extends PHPUnit_Framework_TestCase
{
    function testBaseline(){
        $this->assertFalse(false);
    }

    function testGetName_mocked(){
        $mockedResponse = "MOCKED";
        $actual = new User();
        $user = test::double($actual, ['getName' => $mockedResponse]);
        $result = $user->getName();

        $this->assertEquals($mockedResponse, $result);

    }


}