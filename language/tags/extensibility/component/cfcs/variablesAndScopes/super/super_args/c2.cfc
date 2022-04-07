<cfcomponent extends="p2">
	<cffunction name="f">
		<cfargument name="a1" required="yes">
		<cfargument name="a2" required="yes">
		
		<cfset var i	= 0>
		<cfset var str	= "super.f(">
		
		CHILD<br />

		<cfscript>
			for (i=1; i le arrayLen(arguments); i=i+1){
				if (i neq 1) str = str & ",";
				str = str & "arguments[#i#]";
			}
			str = str & ")";
			evaluate(str);
		</cfscript>

		<cfreturn true>
	</cffunction>
</cfcomponent>