<cfscript>
	st			= structNew();
	st.ts		= now();
	st.message	= "Test Message";
	b = sendGatewayMessage("test", st);
	writeOutput("Status: [#b#]<br />");
</cfscript>