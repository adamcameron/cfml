<cffile action="read" file="C:\webroots\shared\cf\bifs\evaluate\demo.xml" variable="sX">
<cfset x = xmlParse(sX)>
<cfset aDefaults = xmlSearch(x, "/class/properties/property/default")>
<cfdump var="#aDefaults#">

<cfloop index="i" from="1" to="#arrayLen(aDefaults)#">
	<cfset expression = aDefaults[i].xmlText>
	Default: <cfoutput>Expression: [#expression#]; Value: [#evaluate(de(expression))#]</cfoutput><br />
</cfloop>