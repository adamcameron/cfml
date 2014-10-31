
<?php
// NumbersTest.class.php


class NumbersTest extends PHPUnit_Framework_TestCase
{

    private $testNumbers = ["tahi", "rua", "toru", "wha"];
    private $numbers;
    private $mockedTranslator;

    public function setup()
    {
        $this->numbers = new Numbers($this->testNumbers, $this->mockedTranslator);
    }

    public function testGet()
    {
        $result = $this->numbers->get();

        $this->assertEquals($this->testNumbers, $result);
    }


    public function testGetAtIndex()
    {
        $this->assertEquals($this->testNumbers[2], $this->numbers->getAtIndex(2), "Incorrect value returned from getAtIndex()");
    }


    public function testGetFirst()
    {
        $this->assertEquals($this->testNumbers[0], $this->numbers->getFirst(), "Incorrect value returned from getAtIndex()");
    }

    // need to use --process-isolation so this doesn't break everything
    /** @runInSeparateProcess */
    public function testNonExistentMethod()
    {
        $this->numbers->nonExistentMethod();
    }

    public function testTranslateInto()
    {
        $expectedFromTranslate = "MOCKED_RESULT";

        $this->mockedTranslator = test::double('Translator', ['translate' => '$expectedFromTranslate']);

        $result = $this->numbers->translateInto(2, "MOCKED");

        $this->assertEquals($expectedFromTranslate, $result, "Incorrect value returned from translateInto()");
    }

}
