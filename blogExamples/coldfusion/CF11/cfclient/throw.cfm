<cfclient>
<cftry>
<cfthrow type="TestException" message="TestException message" detail="TestException detail">
<cfcatch type="TestException">
	<cfset console.dir(cfcatch)>
</cfcatch>
</cftry>
</cfclient>