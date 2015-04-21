<?php
namespace privateMethods;


class SomeClassTest extends \PHPUnit_Framework_TestCase {

	private $testObject;

	function setup(){
		$this->testObject = new SomeClass();
	}

	/**
	@covers setSomePublicProperty
	*/
	function testSetSomePublicProperty(){
		$testValue = 17;

		$this->testObject->setSomePublicProperty($testValue);

		$expected = $testValue;
		$actual = $this->testObject->somePublicProperty;
		$this->assertEquals($expected, $actual);
	}

	/**
	@covers setSomePrivateProperty
	@covers getSomePrivateProperty
	*/
	function testSomePrivateProperty(){
		$testValue = 19;

		$this->testObject->setSomePrivateProperty($testValue);	

		$expected = $testValue;
		$actual = $this->testObject->getSomePrivateProperty();
		$this->assertEquals($expected, $actual);
	}

	/**
	@covers getVariationOfSomePrivateProperty
	@covers defaultHandler
	*/
	function testGetVariationOfSomePrivateProperty_withString(){
		$testValue = 'test_value';

		$this->testObject->setSomePrivateProperty($testValue);	

		$actual = $this->testObject->getVariationOfSomePrivateProperty();
		$expected = strtoupper($testValue);

		$this->assertTrue(strcmp($expected, $actual) === 0);
	}

	/**
	@covers getVariationOfSomePrivateProperty
	@covers defaultHandler
	*/
	function testGetVariationOfSomePrivateProperty_withNonString(){
		$testValue = new \DateTime();

		$this->testObject->setSomePrivateProperty($testValue);	

		$actual = $this->testObject->getVariationOfSomePrivateProperty();

		$this->assertFalse($actual);
	}

	/**
	@covers getVariationOfSomePrivateProperty
	@covers numericHandler
	*/
	function testGetVariationOfSomePrivateProperty_withNumeric(){
		$testValue = 23;

		$this->testObject->setSomePrivateProperty($testValue);	

		$actual = $this->testObject->getVariationOfSomePrivateProperty();
		$expected = $testValue * $testValue;

		$this->assertEquals($expected, $actual);
	}

	/**
	@covers getVariationOfSomePrivateProperty
	@covers arrayHandler
	@covers isIndexedArray
	*/
	function testGetVariationOfSomePrivateProperty_withIndexedArray(){
		$testValue = [29,31,37];

		$this->testObject->setSomePrivateProperty($testValue);	

		$actual = $this->testObject->getVariationOfSomePrivateProperty();
		$expected = [58,62,74];

		$this->assertEquals($expected, $actual);
	}

	/**
	@covers getVariationOfSomePrivateProperty
	@covers arrayHandler
	@covers isIndexedArray
	*/
	function testGetVariationOfSomePrivateProperty_withAssociativeArray(){
		$testValue = [
			'z' => 41, 
			'y' => 43, 
			'x' => 47 
		];

		$this->testObject->setSomePrivateProperty($testValue);	

		$actual = $this->testObject->getVariationOfSomePrivateProperty();
		$expected = [94,86,82];

		$this->assertEquals($expected, $actual);
	}

	/**
	@covers isIndexedArray
	*/
	function testIsIndexedArray(){
		$exposedMethod = $this->makePublic($this->testObject, 'isIndexedArray');
		$testValue = [53,59,61];

		//$actual = $exposedMethod->invoke($this->testObject, $testValue);
		$actual = $this->executePrivateMethod($this->testObject, 'isIndexedArray', [$testValue]);

		$this->assertTrue($actual);
	}

	/**
	@covers isIndexedArray
	*/

	function testIsIndexedArray_withAssociativeArray(){
		$exposedMethod = $this->makePublic($this->testObject, 'isIndexedArray');
		$testValue = ['a'=>67,'b'=>71,'c'=>73];

		//$actual = $exposedMethod->invoke($this->testObject, $testValue);
		$actual = $this->executePrivateMethod($this->testObject, 'isIndexedArray', [$testValue]);

		$this->assertFalse($actual);
	}

	private function makePublic($object, $method){
		$reflectedMethod = new \ReflectionMethod($object, $method);
		$reflectedMethod->setAccessible(true);
		return $reflectedMethod;		
	}

/*
	private function executePrivateMethod($object, $method, $arguments){
		$reflectedMethod = new \ReflectionMethod($object, $method);
		$reflectedMethod->setAccessible(true);

		$result = $reflectedMethod->invoke($object, ...$arguments);
		return $result;		
	}
*/
	private function executePrivateMethod($object, $method, $arguments){
		$reflectedMethod = new \ReflectionMethod($object, $method);
		$reflectedMethod->setAccessible(true);

		$result = $reflectedMethod->invokeArgs($object, $arguments);
		return $result;		
	}

}
