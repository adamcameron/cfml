// Circle.cfc
component extends=TwoDimensionalShape {

	private this.radius;

	function init(radius){
		this.radius = arguments.radius
	}

	function getCircumference(){
		return 2 * pi() * this.radius
	}

	function getPerimeter(){
		return getCircumference()
	}

	function getArea(){
		return pi() * (this.radius ^ 2)
	}

}