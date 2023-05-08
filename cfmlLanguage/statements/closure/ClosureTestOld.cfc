component {

	public ClosureTest function init(numeric number){
		variables.number = arguments.number;
		return this;
	}

	public void function setNumber(numeric number){
		variables.number = arguments.number;
	}

	public any function f(){
		var number = variables.number;
		c = closure(){
			return number * 2;
		};
		return c;
	}
}