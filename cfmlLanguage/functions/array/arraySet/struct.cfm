<cfscript>
	a = arrayNew(1);
	arraySet(a, 1, 4, structNew());
	a[1].one = "tahi";
	a[2].two = "rua";
	a[3].three = "toru";
	a[4].four = "wha";
</cfscript>
<cfdump var="#a#">