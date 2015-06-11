<cftry>
<cffile action="read" file="#expandPath('./toQuery.csv')#" variable="sCsv">
<cfset oHttpTable = createObject("java", "coldfusion.tagext.net.HttpTable")>
<cfset oHttpTable.populate(sCsv, ",", """", true)>
<cfdump var="#oHttpTable#">
<cfcatch>
	<cfdump var="#oHttpTable#">
	<cfdump var="#cfcatch#" expand="false">
</cfcatch>
</cftry>