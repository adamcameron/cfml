// AdditionalOptional.cfc
component implements="IAdditionalOptional" {

	public numeric function f(required numeric x, numeric y){
		if (structKeyExists(arguments, "y")){
			return x * y;
		}else{
			return x * 2;
		}
	}

}