<?php
// TwoDimensionalShapes.class.php

abstract class TwoDimensionalShapes extends Shape {

	protected $dimensions = 2;

	abstract public function getPerimeter();
	abstract public function getArea();

}