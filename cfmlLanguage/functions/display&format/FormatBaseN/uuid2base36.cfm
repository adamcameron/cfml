<cfset iHex = hash(createUuid())>
<cfset iB36 = "">
<cfset iStep = 7>

<cfoutput>
	Hash: #iHex#<br /><br />
<cfloop index="i" from="1" to="#len(iHex)#" step="#iStep#">
	<cfset iHexPart = mid(iHex, i, iStep)>
	<cfset iB36Part = formatBaseN(inputBaseN(iHexPart, 16), 36)>
	<cfset iB36 = iB36 & iB36Part>
	Hex part: #iHexPart#<br />
	Base-36 part: #iB36Part#<br />
</cfloop>
<br />Base 36: #uCase(reReplace(iB36, "(.{4})", "\1-", "ALL"))#<br />



</cfoutput>