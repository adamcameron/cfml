<cfset xmlFile = '<?xml version="1.0" encoding="iso-8859-1"?>
<AAA> 
	<BBB id = "b1"/> 
	<BBB id = "b2"/> 
	<BBB name = "bbb"/> 
	<BBB/> 
</AAA> 
'>
<cfset xmlDoc = xmlParse(xmlFile)>
<cfdump var="#xmlDoc#" label="Starting Doc">

<cfset match = xmlSearch(xmlDoc, "//BBB")>
<cfloop index="i" from="1" to="#arrayLen(match)#">
	<cfif structKeyExists(match[i], "xmlAttributes") and arrayLen(structKeyArray(match[i].xmlAttributes))>
		<cfset attrs = match[i].xmlAttributes>
		<cfloop collection="#attrs#" item="key">
			<cfset attrs[key] = attrs[key] & "foo"><!--- Note that I'm "changing" the ARRAY element, not the XML doc itself  --->
		</cfloop>
	</cfif>
</cfloop>
<cfdump var="#xmlDoc#" label="Doc after modifications">