<cfxml variable="firstXMLDoc">
	<doc>
		<node>1</node>
		<node>2</node>
		<node>3</node>
	</doc>
</cfxml>

<cfxml variable="secondXMLDoc">
<doc>
	<node>A</node>
	<node>B</node>
	<node>
		<name>leigh</name>
	</node>
</doc>
</cfxml>

<!--- Demonstrate they're valid XML docs: --->
<cfdump var="#firstXMLDoc#" label="Before">
<cfdump var="#secondXMLDoc#" label="Before">

<!--- this works fine, but is not very useful --->
<cfset firstXMLDoc.doc.xmlChildren[1] = firstXMLDoc.doc.xmlChildren[3]>
<cfdump var="#firstXMLDoc#" label="After">

<!--- this doesn't works --->
<cfset firstXMLDoc.doc.xmlChildren[1] = secondXMLDoc.doc.xmlChildren[3]>
<cfdump var="#firstXMLDoc#" label="Won't get to this one">
