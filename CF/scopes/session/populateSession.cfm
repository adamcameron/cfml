<cfscript>
	session.stTest = structNew();
	session.stTest.s = "Hello World";
	session.stTest.c = "x";
	session.stTest.u = createUuid();
	session.stTest.ts= now();
	session.stTest.a = listToArray("one,two,three");
</cfscript>
<cfdump var="#session#">