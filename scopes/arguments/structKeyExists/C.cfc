<cfcomponent>


	<cffunction name="f">
		<cfargument name="arg1" required="false">
		<cfargument name="arg2" required="false">
		<cfargument name="arg3" required="false">
		
		<cfscript>
			var st = structNew();
		</cfscript>
		<cfdump var="#arguments#" label="arguments">
		<cfscript>
			
			st.structKeyExists.arg1 = structKeyExists(arguments, "arg1");
			st.structKeyExists.arg2 = structKeyExists(arguments, "arg2");
			st.structKeyExists.arg3 = structKeyExists(arguments, "arg3");
			
			st.isDefined.arg1 = isDefined("arguments.arg1");
			st.isDefined.arg2 = isDefined("arguments.arg2");
			st.isDefined.arg3 = isDefined("arguments.arg3");

			return st;
		</cfscript>
	</cffunction>
	
	
	<cffunction name="g">
		<cfargument name="arg1" required="false">
		<cfargument name="arg2" required="false">
		<cfargument name="arg3" required="false">

		<cfdump var="#arguments#" label="g() arguments">
		<cfreturn f(argumentCollection=arguments)>
	</cffunction>


</cfcomponent>