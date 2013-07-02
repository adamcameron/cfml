// RequiredArg.cfc
component implements="IRequiredArg" {

	public numeric function f(required numeric x, numeric y=2){
		return x * y;
	}

}