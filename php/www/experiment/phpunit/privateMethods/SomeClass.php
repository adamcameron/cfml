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

	public function getVariationOfSomePublicProperty(){
		if (is_numeric($this->somePublicProperty)){
			return $this->numericHandler();
		}
		if (is_array($this->somePublicProperty)){
			return $this->arrayHandler();
		}
		return $this->defaultHandler();
	}

	private function numericHandler(){
		return $this->somePublicProperty * $this->somePublicProperty;
	}

	private function arrayHandler(){

	}

	private function defaultHandler(){
		return is_string($this->somePublicProperty) ? strtoupper($this->somePublicProperty) : false; 
	}

}