<cfscript>
	st = structNew();
	st.key1	= "set";
	structInsert(st, "key1", "set again");
</cfscript>
<cfdump var="#st#">