<cfscript>
	st			= structNew();
	st["'"]		= true;
	st['"']		= true;
	st['##']	= true;
	st['.']		= true;
	st[chr(7)]	= true;
</cfscript>
<cfdump var="#st#">
<cfloop item="sKey" collection="#st#">
	<cfoutput>[#sKey#][#st[sKey]#]<br /></cfoutput>
</cfloop>