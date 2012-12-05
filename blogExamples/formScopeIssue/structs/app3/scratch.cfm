<cfscript>
	
	writeDump(createObject("java", "java.lang.System").identityHashCode(session));
	structClear(session);
</cfscript>