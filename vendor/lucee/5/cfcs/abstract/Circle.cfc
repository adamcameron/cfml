// Circle.cfc
component extends=Shape {
	
	variables.sides = 1;

	public numeric function init(required numeric radius){
		variables.radius = arguments.radius
	}

	public numeric function calculatePerimeter(){
		return pi() * (radius^2)
	}
}