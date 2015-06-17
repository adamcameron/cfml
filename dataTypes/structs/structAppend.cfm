<cfscript>
	function structBuild() { return arguments;}
	
	s1 = structBuild(key1="one");
	s2 = structBuild(key2="two");
	
	structAppend(s1, s2);
</cfscript>

<cfdump var="#s1#">
<cfdump var="#s2#">