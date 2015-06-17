<cfscript>
	myAttributes.__app = {
		name = "",
		bundle = ""
	};
</cfscript>
<cfdump var="#myAttributes#">

<cfscript>
	myAttributes.__app.name = "";
	myAttributes.__app.bundle = "";
</cfscript>
<cfdump var="#myAttributes#">

<cfoutput>server.coldfusion.productversion: #server.coldfusion.productversion#</cfoutput>

