<cfif thisTag.ExecutionMode eq "end">
	<cfdump var="#getPageContext().toString()#"><br />
	<cfset thisTag.generatedContent = ucase(thisTag.generatedContent)>
	
</cfif>
