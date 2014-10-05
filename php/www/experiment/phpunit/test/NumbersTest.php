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

        $this->assertEquals($this->testNumbers, $result);
    }


    function testGetAtIndex(){
        $result = $this->numbers->getAtIndex(2);

        $this->assertEquals($this->testNumbers[2], $this->numbers->getAtIndex(2), "Incorrect value returned from getAtIndex()");
    }

    // need to use --process-isolation so this doesn't break everything
    function testNonExistentMethod(){
        $this->numbers->nonExistentMethod();
    }

    function testTranslateInto(){
        $expectedFromTranslate = "MOCKED_RESULT";

        $translator = $this->getMock('Translator', ["translate"]);
        $translator->method("translate")->will($this->returnValue($expectedFromTranslate));

        $this->numbers->attach($translator);

        $result = $this->numbers->translateInto(2, "MOCKED");

        $this->assertEquals($expectedFromTranslate, $result, "Incorrect value returned from translateInto()");
    }

}
