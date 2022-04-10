// FirstDependency.cfc
component {

	public void function methodRequiringGroups1And2(required struct group1, required struct group2){
		if (!structKeyExists(arguments.group1, "property1")){
			throw(type="InvalidArgumentException");
		}
		if (!structKeyExists(arguments.group1, "property2")){
			throw(type="InvalidArgumentException");
		}
		if (!structKeyExists(arguments.group1, "property3")){
			throw(type="InvalidArgumentException");
		}
		if (!structKeyExists(arguments.group1, "property4")){
			throw(type="InvalidArgumentException");
		}
		if (!structKeyExists(arguments.group2, "property1")){
			throw(type="InvalidArgumentException");
		}
		if (!structKeyExists(arguments.group2, "property2")){
			throw(type="InvalidArgumentException");
		}
		if (!structKeyExists(arguments.group2, "property3")){
			throw(type="InvalidArgumentException");
		}
		if (!structKeyExists(arguments.group2, "property4")){
			throw(type="InvalidArgumentException");
		}
	}

}