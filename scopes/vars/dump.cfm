<cffunction name="f">
	<cfargument name="a">
	<cfset var v = "hello world">
	<cftry>
		<cfdump var="#getPageContext().getActiveFunctionLocalScope()#" label="getPageContext().getActiveFunctionLocalScope()">
		<cfcatch>
			Error dumping getPageContext().getActiveFunctionLocalScope(): <cfoutput>[#cfcatch.message#][#cfcatch.detail#]<br /></cfoutput>
		</cfcatch>
	</cftry>
	<cftry>
		<cfdump var="#locals#" label="locals">
		<cfcatch>
			Error dumping locals: <cfoutput>[#cfcatch.message#][#cfcatch.detail#]<br /></cfoutput>
		</cfcatch>
	</cftry>
</cffunction>

<cfset f(a="my argument")>