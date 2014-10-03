<?php
// NumbersTest.class.php

require dirname(__FILE__) . "/../actual/Numbers.class.php";

class NumbersTest extends PHPUnit_Framework_TestCase
{

    private $testNumbers = ["tahi", "rua", "toru", "wha"];
    private $numbers;

    function setup(){
        $this->numbers = new Numbers($this->testNumbers);
    }

    function testGet(){
        $result = $this->numbers->get();

        $this->assertEquals($result, $this->testNumbers);
    }
}
