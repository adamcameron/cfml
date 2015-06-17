<cfset oCv = createObject("java", "ClassViewer")>

<cftry>
<cfset oHttpTable = createObject("java", "coldfusion.sql.QueryTable")>
<cfset oHttpTable = oHttpTable.init()>
<pre>
	<cfoutput>#oCv.viewObject(oHttpTable)#</cfoutput>
</pre>
<cfcatch>
	<cfdump var="#oHttpTable#">
	<cfdump var="#cfcatch#" expand="false">
</cfcatch>
</cftry>