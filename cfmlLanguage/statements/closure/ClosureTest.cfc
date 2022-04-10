component {

	public any function f(numeric number){
		c = closure(){
			return arguments.number * 2;
		};
		return c;
	}
}