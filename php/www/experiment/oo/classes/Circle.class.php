<?php
// Circle.class.php

class Circle extends TwoDimensionalShapes {

	protected $radius;

	public function __construct($radius){
		$this->radius = $radius;
	}

	public function getCircumference(){
		return 2 * pi() * $this->radius;
	}

	public function getPerimeter(){
		return $this->getCircumference();
	}

	public function getArea(){
		return pi() * $this->radius * $this->radius;
	}

}