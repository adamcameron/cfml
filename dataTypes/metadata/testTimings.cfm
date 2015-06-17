<!--- testTimings.cfm --->
<cfscript>
	start = getTickCount();
	o1 = new Big();
	writeOutput("#getTickCount()-start#ms to create the first object<br />");

	start = getTickCount();
	o2 = new Big();
	writeOutput("#getTickCount()-start#ms to create the second object<br />");

	start = getTickCount();
	md1 = getMetadata(o1);
	writeOutput("#getTickCount()-start#ms to generate metadata the first time<br />");

	start = getTickCount();
	md2 = getMetadata(o2);
	writeOutput("#getTickCount()-start#ms to generate metadata the second time<br />");
</cfscript>