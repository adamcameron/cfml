<?php
namespace privateMethods;
class SomeClass {

	private $somePrivateProperty;
	public $somePublicProperty;

	public function setSomePublicProperty($somePublicProperty){
		$this->somePublicProperty = $somePublicProperty;
	}

	public function setSomePrivateProperty($somePrivateProperty){
		$this->somePrivateProperty = $somePrivateProperty;
	}

	public function getSomePrivateProperty(){
		return $this->somePrivateProperty;
	}

	public function getVariationOfSomePrivateProperty(){
		if (is_numeric($this->somePrivateProperty)){
			return $this->numericHandler();
		}
		if (is_array($this->somePrivateProperty)){
			return $this->arrayHandler();
		}
		return $this->defaultHandler();
	}

	private function numericHandler(){
		return $this->somePrivateProperty * $this->somePrivateProperty;
	}

	private function arrayHandler(){
		if ($this->isIndexedArray($this->somePrivateProperty)){
			return array_map(function($value){
				return $value * 2;
			}, $this->somePrivateProperty);
		}
		$tempArray = $this->somePrivateProperty;
		ksort($tempArray);
		return array_reduce($tempArray, function($array, $value){
			$array[] = $value + $value;
			return $array;
		}, []);
	}

	private function defaultHandler(){
		return is_string($this->somePrivateProperty) ? strtoupper($this->somePrivateProperty) : false; 
	}

	private function isIndexedArray($array){
		return array_values($array) == $array;
	}

}