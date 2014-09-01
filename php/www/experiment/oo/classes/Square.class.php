<?php
// Square.class.php
class Circle extends TwoDimensionalShape {

	protected $sideLength;

	public function __construct($sideLength){
		$this->sideLength = $sideLength;
	}

	public function getPerimeter(){
		return $this->sideLength * 4;
	}

}