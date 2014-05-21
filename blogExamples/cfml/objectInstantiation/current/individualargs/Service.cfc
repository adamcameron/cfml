// Service.cfc
component {

	public Service function init(required FirstDependency firstDependency, required SecondDependency secondDependency){
		variables.firstDependency	= arguments.firstDependency;
		variables.secondDependency	= arguments.secondDependency;

		return this;
	}

	public void function entryPoint(
		required string grouping1Arg1,
		required string grouping1Arg2,
		required string grouping1Arg3,
		required string grouping1Arg4,
		required string grouping2Arg1,
		required string grouping2Arg2,
		required string grouping2Arg3,
		required string grouping2Arg4,
		string grouping3Arg1,
		string grouping3Arg2,
		string grouping3Arg3,
		string grouping3Arg4,
		string grouping4Arg1,
		string grouping4Arg2,
		string grouping4Arg3,
		string grouping4Arg4
	){
		internalMethodRequiringAllOFGroup1(
			grouping1Arg1 = grouping1Arg1,
			grouping1Arg2 = grouping1Arg2,
			grouping1Arg3 = grouping1Arg3,
			grouping1Arg4 = grouping1Arg4
		);

		var methodArgs = {
			grouping1Arg1 = grouping1Arg1,
			grouping1Arg2 = grouping1Arg2,
			grouping1Arg3 = grouping1Arg3,
			grouping1Arg4 = grouping1Arg4
		};
		if (structKeyExists(arguments, "grouping3Arg1")){
			methodArgs.grouping3Arg1 = arguments.grouping3Arg1;
		}else{
			methodArgs.grouping3Arg1 = "grouping3Arg1Default";
		}
		if (structKeyExists(arguments, "grouping3Arg2")){
			methodArgs.grouping3Arg2 = arguments.grouping3Arg2;
		}else{
			methodArgs.grouping3Arg2 = "grouping3Arg2Default";
		}
		if (structKeyExists(arguments, "grouping3Arg3")){
			methodArgs.grouping3Arg3 = arguments.grouping3Arg3;
		}else{
			methodArgs.grouping3Arg3 = "grouping3Arg3Default";
		}
		if (structKeyExists(arguments, "grouping3Arg4")){
			methodArgs.grouping3Arg4 = arguments.grouping3Arg4;
		}else{
			methodArgs.grouping3Arg4 = "grouping3Arg4Default";
		}
		internalMethodRequiringAllOFGroup1AndGroup3(argumentCollection=methodArgs);

		variables.firstDependency.methodRequiringGroups1And2(
			grouping1Arg1 = grouping1Arg1,
			grouping1Arg2 = grouping1Arg2,
			grouping1Arg3 = grouping1Arg3,
			grouping1Arg4 = grouping1Arg4,
			grouping2Arg1 = grouping2Arg1,
			grouping2Arg2 = grouping2Arg2,
			grouping2Arg3 = grouping2Arg3,
			grouping2Arg4 = grouping2Arg4
		);

		methodArgs.grouping2Arg1 = grouping2Arg1;
		methodArgs.grouping2Arg2 = grouping2Arg2;
		methodArgs.grouping2Arg3 = grouping2Arg3;
		methodArgs.grouping2Arg4 = grouping2Arg4;
		if (structKeyExists(arguments, "grouping4Arg1")){
			methodArgs.grouping4Arg1 = arguments.grouping4Arg1;
		}else{
			methodArgs.grouping4Arg1 = "grouping4Arg1Default";
		}
		if (structKeyExists(arguments, "grouping4Arg2")){
			methodArgs.grouping4Arg2 = arguments.grouping4Arg2;
		}else{
			methodArgs.grouping4Arg2 = "grouping4Arg2Default";
		}
		if (structKeyExists(arguments, "grouping4Arg3")){
			methodArgs.grouping4Arg3 = arguments.grouping4Arg3;
		}else{
			methodArgs.grouping4Arg3 = "grouping4Arg3Default";
		}
		if (structKeyExists(arguments, "grouping4Arg4")){
			methodArgs.grouping4Arg4 = arguments.grouping4Arg4;
		}else{
			methodArgs.grouping4Arg4 = "grouping4Arg4Default";
		}
		variables.secondDependency.methodRequiringAllArgs(argumentCollection=methodArgs);
	}

	private void function internalMethodRequiringAllOFGroup1(
		required string grouping1Arg1,
		required string grouping1Arg2,
		required string grouping1Arg3,
		required string grouping1Arg4
	){

	}

	private void function internalMethodRequiringAllOFGroup1AndGroup3(
		required string grouping1Arg1,
		required string grouping1Arg2,
		required string grouping1Arg3,
		required string grouping1Arg4,
		required string grouping3Arg1,
		required string grouping3Arg2,
		required string grouping3Arg3,
		required string grouping3Arg4
	){

	}

}