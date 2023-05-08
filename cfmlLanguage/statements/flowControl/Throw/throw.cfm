<cftry>
<cfthrow type="Expression" errorcode="0" message="Throw Message" detail="Throw Detail" extendedinfo="Throw extended info">
<cfcatch>
	<cfdump var="#cfcatch#">
</cfcatch>
</cftry>

<cfscript>
	try{
		throw(
			type		= "ExpressionException",
			errorcode	= 0,
			message		= "Throw Message",
			detail		= "Throw Detail",
			extendedinfo= "Throw extended info"
		);
	} catch (any e){
		writeDump(var=e);
	}

</cfscript>