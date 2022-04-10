<cfcomponent>
	<cffunction name="bridge">
		<cfargument name="call"		type="string" required="yes">
		<cfargument name="payload"	type="string" required="yes">

		<cfscript>
			var o		= this;
			var f		= "";
			if (listLen(arguments.call, ".") gt 1){
				o = createObject("component", listDeleteAt(arguments.call, listLen(arguments.call, "."), "."));
			}
			f = o[listLast(arguments.call, ".")];
			return f(argumentCollection=arguments);
		</cfscript>
	</cffunction>


	<cffunction name="callThis">
		<strong>callThis</strong><br />
		<cfdump var="#arguments#" label="arguments">
		<cfdump var="#getMetaData()#" label="getMetaData()">
	</cffunction>

</cfcomponent>