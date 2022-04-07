<cfcomponent>
	<cfdump var="#variables#" label="variables scope @ top of pseudo-constructor">
	<cfscript>
		WhatToUse = "not set";
		StartDate = "1990-01-01";
		EndDate = "1993-01-01";
		x = true;
	</cfscript>
	<cfdump var="#variables#" label="variables scope @ bottom of pseudo-constructor">
	<br /><hr />


	<cffunction name="init" returntype="BlocksAndClosures" output="true">
		<cfdump var="#variables#" label="variables scope @ top of init()">
		<cfdump var="#arguments#" label="arguments scope @ top of init()">
		<cfdump var="#getPageContext().getActiveFunctionLocalScope()#" label="getPageContext().getActiveFunctionLocalScope() scope @ top of init()">
		<cfscript>
			StartDate = CreateOdbcDate(arguments.StartDate);
			EndDate = CreateOdbcDate(arguments.EndDate);
			WhatToUse = "something else";
		</cfscript>
		<cfdump var="#variables#" label="variables scope @ bottom of init()">
		<cfdump var="#arguments#" label="arguments scope @ bottom of init()">
		<cfdump var="#getPageContext().getActiveFunctionLocalScope()#" label="getPageContext().getActiveFunctionLocalScope() scope @ bottom of init()">
		<br /><hr />
		<cfreturn this>
	</cffunction>


	<cffunction name="blocks" returrntype="void" output="true">
		<cfdump var="#variables#" label="variables scope in blocks()">
		<cfdump var="#arguments#" label="arguments scope in blocks()">
		<cfdump var="#getPageContext().getActiveFunctionLocalScope()#" label="getPageContext().getActiveFunctionLocalScope() in blocks()">
		<br /><hr />
	</cffunction>
</cfcomponent>