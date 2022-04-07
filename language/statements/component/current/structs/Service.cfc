// Service.cfc
component {

	public Service function init(required FirstDependency firstDependency, required SecondDependency secondDependency){
		variables.firstDependency	= arguments.firstDependency;
		variables.secondDependency	= arguments.secondDependency;

		return this;
	}

	public void function entryPoint(required struct group1, required struct group2, struct group3, struct group4){
		internalMethodRequiringAllOFGroup1(group1=arguments.group1);

		var methodArgs = {
			group1 = group1
		};
		if (structKeyExists(arguments, "group3")){
			methodArgs.group3 = arguments.group3;
		}else{
			methodArgs.group3 = {
				property1 = "property1default",
				property2 = "property2default",
				property3 = "property3default",
				property4 = "property4default"
			};
		}
		internalMethodRequiringAllOFGroup1AndGroup3(argumentCollection=methodArgs);

		variables.firstDependency.methodRequiringGroups1And2(group1=arguments.group1, group2=arguments.group2);

		methodArgs.group2 = arguments.group2;
		if (structKeyExists(arguments, "group4")){
			methodArgs.group4 = arguments.group4;
		}else{
			methodArgs.group4 = {
				property1 = "property1default",
				property2 = "property2default",
				property3 = "property3default",
				property4 = "property4default"
			};
		}

		variables.secondDependency.methodRequiringAllArgs(argumentCollection=methodArgs);
	}

	private void function internalMethodRequiringAllOFGroup1(required struct group1){
	}

	private void function internalMethodRequiringAllOFGroup1AndGroup3(required struct group1, required struct group3){
	}

}