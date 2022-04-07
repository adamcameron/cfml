<cffile action="read" charset="iso-8859-1" file="#expandPath('./')#data.xml" variable="xmlFile">
<cfset xmlDoc = xmlParse(xmlFile)>
<cfdump var="#xmlDoc#">

<cfset nodeList=XmlSearch(xmlDoc,"/AAA/BBB/@*")>
<cfloop index="i" from="1" to="#arrayLen(nodeList)#">
	<cfdump var="#nodeList[i].getNodeValue()#"><br />
</cfloop>

