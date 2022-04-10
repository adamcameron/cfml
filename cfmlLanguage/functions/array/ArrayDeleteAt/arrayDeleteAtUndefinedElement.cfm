<cfscript>
	a = arrayNew(1);
	a[1] = "one";
	a[3] = "three";
//	writeOutput(a[2]);
//	writeOutput(isArray(a[2]));
	writeOutput(arrayDeleteAt(a, 2));

</cfscript>
<cfdump var="#a#">