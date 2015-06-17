// TwoDimensionalShape.cfc
abstract component extends=Shape {

	private this.dimensions = 2;

	abstract function getPerimeter();
	abstract function getArea();

}