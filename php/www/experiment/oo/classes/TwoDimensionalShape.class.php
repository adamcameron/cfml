<?php
// TwoDimensionalShape.class.php
abstract class TwoDimensionalShape extends Shape {

	protected $dimensions = 2;

	abstract public function getPerimeter();
	abstract public function getArea();

	public function serialise(){
		return json_encode([
			"dimensions" => $this->getDimensions(),
			"perimeter" => $this->getPerimeter(),
			"area" => $this->getArea()
		]);
	}

}