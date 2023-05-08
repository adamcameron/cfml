// Validator.cfc
component {

	public boolean function isValidOptionalValue(required struct data, required string keyToValidate, required string validationCallback){
		if (!structKeyExists(arguments.data, arguments.keyToValidate)){
			return true;
		}
		return arguments.validationCallback(argumentCollection=arguments);
	}

}
