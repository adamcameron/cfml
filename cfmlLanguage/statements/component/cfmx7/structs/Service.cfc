<!--- Service.cfc --->
<cfcomponent output="false">

	<cffunction name="init" returntype="Service" access="public" output="false">
		<cfargument name="firstDependency" type="FirstDependency" required="true">
		<cfargument name="secondDependency" type="SecondDependency" required="true">

		<cfscript>
		variables.firstDependency	= arguments.firstDependency;
		variables.secondDependency	= arguments.secondDependency;

		return this;
		</cfscript>
	</cffunction>

	<cffunction name="entryPoint" returntype="void" access="public" output="false">
		<cfargument name="group1" type="struct" required="true">
		<cfargument name="group2" type="struct" required="true">
		<cfargument name="group3" type="struct" required="true">
		<cfargument name="group4" type="struct" required="true">

		<cfscript>
		var methodArgs = structNew();
		internalMethodRequiringAllOFGroup1(group1=arguments.group1);

		methodArgs.group1 = group1;
		
		if (structKeyExists(arguments, "group3")){
			methodArgs.group3 = arguments.group3;
		}else{
			methodArgs.group3 = structNew();
			methodArgs.group3.property1 = "property1default";
			methodArgs.group3.property2 = "property2default";
			methodArgs.group3.property3 = "property3default";
			methodArgs.group3.property4 = "property4default";
		}
		internalMethodRequiringAllOFGroup1AndGroup3(argumentCollection=methodArgs);

		variables.firstDependency.methodRequiringGroups1And2(group1=arguments.group1, group2=arguments.group2);

		methodArgs.group2 = arguments.group2;
		if (structKeyExists(arguments, "group4")){
			methodArgs.group4 = arguments.group4;
		}else{
			methodArgs.group4 = structNew();
			methodArgs.group4.property1 = "property1default";
			methodArgs.group4.property2 = "property2default";
			methodArgs.group4.property3 = "property3default";
			methodArgs.group4.property4 = "property4default";
		}

		variables.secondDependency.methodRequiringAllArgs(argumentCollection=methodArgs);
		</cfscript>
	</cffunction>

	<cffunction name="internalMethodRequiringAllOFGroup1" returntype="void" access="private" output="false">
		<cfargument name="group1" type="struct" required="true">
	</cffunction>

	<cffunction name="internalMethodRequiringAllOFGroup1AndGroup3" returntype="void" access="private" output="false">
		<cfargument name="group1" type="struct" required="true">
		<cfargument name="group3" type="struct" required="true">
	</cffunction>

</cfcomponent>