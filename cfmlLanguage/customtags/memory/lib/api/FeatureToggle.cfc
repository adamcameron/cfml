component {

	variables.SOME_ENABLED_FEATURE = true;
	variables.SOME_DISABLED_FEATURE = false;

	public boolean function featureEnabled(required string feature){
		return structKeyExists(variables, feature) && variables[feature];
	}

}