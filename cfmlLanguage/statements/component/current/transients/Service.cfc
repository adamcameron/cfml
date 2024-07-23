// Service.cfc
component {

	public Service function init(required FirstDependency firstDependency, required SecondDependency secondDependency){
		variables.firstDependency	= arguments.firstDependency;
		variables.secondDependency	= arguments.secondDependency;

		return this;
	}

	public void function entryPoint(required Group1 group1, required Group2 group2, Group3 group3, Group4 group4){
		internalMethodRequiringAllOFGroup1(group1=arguments.group1);

		var methodArgs = {
			group1 = group1
		};
		if (structKeyExists(arguments, "group3")){
			methodArgs.group3 = arguments.group3;
		}else{
			methodArgs.group3 = new Group3();
		}
		internalMethodRequiringAllOFGroup1AndGroup3(argumentCollection=methodArgs);

		variables.firstDependency.methodRequiringGroups1And2(group1=arguments.group1, group2=arguments.group2);

		methodArgs.group2 = arguments.group2;
		if (structKeyExists(arguments, "group4")){
			methodArgs.group4 = arguments.group4;
		}else{
			methodArgs.group4 = new Group4();
		}
		variables.secondDependency.methodRequiringAllArgs(argumentCollection=methodArgs);
	}

	private void function internalMethodRequiringAllOFGroup1(required Group1 group1){
	}

	private void function internalMethodRequiringAllOFGroup1AndGroup3(required Group1 group1, required Group3 group3){
	}

}