/**
@hint This is my cfc
@output false
*/
component persistent=true {
	variables.i = 1 / 0;

	/**
	@hint This is the f function
	@output false
	*/
	public void function f(numeric i){
		return;
	}

}