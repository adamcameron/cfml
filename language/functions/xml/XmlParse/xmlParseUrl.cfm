<cfset sUrl =  "http://pce.afd.co.uk/addresslookup.pce?serial=818131&password=Advantage&postcode=#URL.PC#">

<!--- <cfset xPceData = xmlParse(sUrl)>
<cfdump var="#xPceData#"> --->


<cfhttp	url			= "#sUrl#"
		method		= "get"
		throwonerror="true"
		timeout		= "10"
		result		= "stPceData"
/>

<cfset xPceData = xmlParse(stPceData.fileContent)>
<cfset sGridEast	= xPceData["AFDPostcodeEverywhere"]["Address"]["GridEast"].xmltext>
<cfset sGridNorth	 = xPceData["AFDPostcodeEverywhere"]["Address"]["GridNorth"].xmltext>
<cfdump var="#variables#">