<cfscript>
	sBasePath = expandPath("./");
	sXml = sBasePath & "w3schools.xml";
	sXsd = sBasePath & "w3schools.xsd";
</cfscript>
	
<cfset xXsd = xmlParse(sXsd)>
<cfdump var="#xXsd#">

<cftry>
	<cfset xXml = xmlParse(sXml, true, sXsd)>
	Parse succeeded<br />
	<cfdump var="#xXml#">
	<cfcatch>
		Parse failed<br/>
		<cfoutput>
		[#cfcatch.message#]<br />
		[#cfcatch.detail#]<br />
		</cfoutput>
		<cfset xXml = xmlParse(sXml)>
		<cfdump var="#xXml#">
	</cfcatch>
</cftry>
