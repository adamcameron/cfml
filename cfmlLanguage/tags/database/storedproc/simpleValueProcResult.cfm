<cftry>
<cfstoredproc procedure="simple" datasource="intranet" returnCode="no">
	<CFPROCRESULT name="simple_function">
</cfstoredproc>
<cfdump var="#simple_function#">
<cfcatch>
	<cfdump var="#cfcatch#">
</cfcatch>
</cftry>

<cfquery name="q" datasource="intranet">
	select	simple() as simple_function
	from	dual
</cfquery>
<cfdump var="#q#">