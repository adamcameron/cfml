<cfscript>
	sBasePath = expandPath("./");
	sXml = sBasePath & "base.xml";
	sXsd = sBasePath & "base.xsd";
</cfscript>
	
<cfset xXsd = xmlParse(sXsd)>
<cfdump var="#xXsd#" expand="false">

<cftry>
	<cfset xXml = xmlParse(sXml, true, sXsd)>
	Parse succeeded<br />
	<cfdump var="#xXml#" expand="false">
	<cfcatch>
		Parse failed<br/>
		<cfdump var="#cfcatch#" expand="false">
		<cfset xXml = xmlParse(sXml)>
		<cfdump var="#xXml#" expand="false">
	</cfcatch>
</cftry>
