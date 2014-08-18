<?php
// Shape.class.php
abstract class Shape {

	protected $dimensions;

	public function getDimensions(){
		return $this->dimensions;
	}

}