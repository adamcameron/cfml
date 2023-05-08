<cffunction name="cfFlush" returntype="void" output="no">
	<cfargument name="interval" type="numeric">

	<cfif structKeyExists(arguments, "interval")>
		<cfflush interval="#arguments.interval#">
	<cfelse>
		<cfflush>
	</cfif>
</cffunction>


<cfscript>
	oThread = createObject("java", "java.lang.Thread");

//	cfflush(20);
	for (i=1; i le 100; i=i+1){
		writeOutput("[#i#]<br />");
		oThread.sleep(333);
		if (not i mod 20) cfflush(20);
	}

</cfscript>