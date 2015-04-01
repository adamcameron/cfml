<?php
namespace privateMethods;


class SomeClassTest extends \PHPUnit_Framework_TestCase {

	private $testObject;

	function setup(){
		$this->testObject = new SomeClass();
	}

	function testSetSomePublicProperty(){
		$testValue = 17;
		$this->testObject->setSomePublicProperty($testValue);	

		$this->assertEquals($testValue, $this->testObject->somePublicProperty);
	}

}
