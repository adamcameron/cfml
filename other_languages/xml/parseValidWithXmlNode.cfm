<cfset sFile = getDirectoryFromPath(getCurrentTemplatePath()) & "validWithXmlNode.xml">
<cfset x = xmlParse(sFile)>
<cfdump var="#x#">

<cfxml variable="x">
	<xml>
		<top><middle>bottom</middle></top>
	</xml>
</cfxml>
<cfdump var="#x#">
