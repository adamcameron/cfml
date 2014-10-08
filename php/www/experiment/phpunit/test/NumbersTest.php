<?php
// NumbersTest.class.php

class NumbersTest extends PHPUnit_Framework_TestCase
{

    private $testNumbers = ["tahi", "rua", "toru", "wha"];
    private $numbers;
    private $mockedTranslator;

    function setup(){
        $this->mockedTranslator = $this->getMock('Translator', ["translate"]);
        $this->numbers = new Numbers($this->testNumbers, $this->mockedTranslator);
    }

    function testGet(){
        $result = $this->numbers->get();

        $this->assertEquals($this->testNumbers, $result);
    }


    function testGetAtIndex(){
        $this->assertEquals($this->testNumbers[2], $this->numbers->getAtIndex(2), "Incorrect value returned from getAtIndex()");
    }


    function testGetFirst(){
        $this->assertEquals($this->testNumbers[0], $this->numbers->getFirst(), "Incorrect value returned from getAtIndex()");
    }

    // need to use --process-isolation so this doesn't break everything
    /** @runInSeparateProcess */
    function testNonExistentMethod(){
        $this->numbers->nonExistentMethod();
    }

    function testTranslateInto(){
        $expectedFromTranslate = "MOCKED_RESULT";

        $this->mockedTranslator->expects($this->any())->method("translate")->will($this->returnValue($expectedFromTranslate));

        $result = $this->numbers->translateInto(2, "MOCKED");

        $this->assertEquals($expectedFromTranslate, $result, "Incorrect value returned from translateInto()");
    }

}
