<cfset oCv = createObject("java", "ClassViewer")>

<cftry>
<cfset oHttpTable = createObject("java", "coldfusion.tagext.net.HttpTable")>
<cfset oHttpTable = oHttpTable.init(javaCast("int", 1))>
<pre>
	<cfoutput>#oCv.viewObject(oHttpTable)#</cfoutput>
</pre>
<cfcatch>
	<cfdump var="#oHttpTable#">
	<cfdump var="#cfcatch#" expand="false">
</cfcatch>
</cftry>