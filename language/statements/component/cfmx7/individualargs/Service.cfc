<!--- Service.cfc --->
<cfcomponent output="false">

	<cffunction name="init" access="public" returntype="Service" output="false">
		<cfargument name="firstDependency" type="FirstDependency" required="true">
		<cfargument name="secondDependency" type="SecondDependency" required="true">
		<cfscript>
		variables.firstDependency	= arguments.firstDependency;
		variables.secondDependency	= arguments.secondDependency;

		return this;
		</cfscript>
	</cffunction>

	<cffunction name="entryPoint" access="public" returntype="void" output="false">
		<cfargument name="grouping1Arg1" type="string" required="true">
		<cfargument name="grouping1Arg2" type="string" required="true">
		<cfargument name="grouping1Arg3" type="string" required="true">
		<cfargument name="grouping1Arg4" type="string" required="true">
		<cfargument name="grouping2Arg1" type="string" required="true">
		<cfargument name="grouping2Arg2" type="string" required="true">
		<cfargument name="grouping2Arg3" type="string" required="true">
		<cfargument name="grouping2Arg4" type="string" required="true">
		<cfargument name="grouping3Arg1" type="string" required="false">
		<cfargument name="grouping3Arg2" type="string" required="false">
		<cfargument name="grouping3Arg3" type="string" required="false">
		<cfargument name="grouping3Arg4" type="string" required="false">
		<cfargument name="grouping4Arg1" type="string" required="false">
		<cfargument name="grouping4Arg2" type="string" required="false">
		<cfargument name="grouping4Arg3" type="string" required="false">
		<cfargument name="grouping4Arg4" type="string" required="false">
		<cfscript>
		var methodArgs = structNew();
		internalMethodRequiringAllOFGroup1(
			grouping1Arg1 = grouping1Arg1,
			grouping1Arg2 = grouping1Arg2,
			grouping1Arg3 = grouping1Arg3,
			grouping1Arg4 = grouping1Arg4
		);

		methodArgs.grouping1Arg1 = grouping1Arg1;
		methodArgs.grouping1Arg2 = grouping1Arg2;
		methodArgs.grouping1Arg3 = grouping1Arg3;
		methodArgs.grouping1Arg4 = grouping1Arg4;

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
		</cfscript>
	</cffunction>

	<cffunction name="internalMethodRequiringAllOFGroup1" access="private" returntype="void" output="false">
		<cfargument name="grouping1Arg1" type="string" required="true">
		<cfargument name="grouping1Arg2" type="string" required="true">
		<cfargument name="grouping1Arg3" type="string" required="true">
		<cfargument name="grouping1Arg4" type="string" required="true">
	</cffunction>

	<cffunction name="internalMethodRequiringAllOFGroup1AndGroup3" access="private" returntype="void" output="false">
		<cfargument name="grouping1Arg1" type="string" required="true">
		<cfargument name="grouping1Arg2" type="string" required="true">
		<cfargument name="grouping1Arg3" type="string" required="true">
		<cfargument name="grouping1Arg4" type="string" required="true">
		<cfargument name="grouping3Arg1" type="string" required="true">
		<cfargument name="grouping3Arg2" type="string" required="true">
		<cfargument name="grouping3Arg3" type="string" required="true">
		<cfargument name="grouping3Arg4" type="string" required="true">
	</cffunction>

</cfcomponent>