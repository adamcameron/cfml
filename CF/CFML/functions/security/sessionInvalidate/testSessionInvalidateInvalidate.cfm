<cfscript>
	writeDump(var=session, label="before");
	sessionInvalidate();
	sleep(3000);
	writeDump(var=session, label="after");
</cfscript>