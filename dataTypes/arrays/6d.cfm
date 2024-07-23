<cfscript>
	a = arrayNew(1);
	a[1] = arrayNew(1);
	a[1][1] = arrayNew(1);
	a[1][1][1] = arrayNew(1);
	a[1][1][1][1] = arrayNew(1);
	a[1][1][1][1][1] = arrayNew(1);
	a[1][1][1][1][1] = arrayNew(1);
	a[1][1][1][1][1][1] = "Way down here!";
</cfscript>
<cfdump var="#a#" label="Six dimensions">