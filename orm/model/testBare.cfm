<!---
<cfset o = new Bare()>
<cfdump var="#o#">
 --->
<cfscript>
	o = new Bare();
	system.dump(var=o);
</cfscript>