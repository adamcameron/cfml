// SecondDependency.cfc
component {

	public void function methodRequiringAllArgs(required struct group1, required struct group2, required struct group3, required struct group4){
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
		if (!structKeyExists(arguments.group3, "property1")){
			throw(type="InvalidArgumentException");
		}
		if (!structKeyExists(arguments.group3, "property2")){
			throw(type="InvalidArgumentException");
		}
		if (!structKeyExists(arguments.group3, "property3")){
			throw(type="InvalidArgumentException");
		}
		if (!structKeyExists(arguments.group3, "property4")){
			throw(type="InvalidArgumentException");
		}
		if (!structKeyExists(arguments.group4, "property1")){
			throw(type="InvalidArgumentException");
		}
		if (!structKeyExists(arguments.group4, "property2")){
			throw(type="InvalidArgumentException");
		}
		if (!structKeyExists(arguments.group4, "property3")){
			throw(type="InvalidArgumentException");
		}
		if (!structKeyExists(arguments.group4, "property4")){
			throw(type="InvalidArgumentException");
		}
	}
}