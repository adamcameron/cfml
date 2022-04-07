<cfscript>
	a = arrayNew(1);
	a[1] = "first";
	arrayAppend(a, "second");
	a.append("third");
</cfscript>

<cfdump var="#a#">