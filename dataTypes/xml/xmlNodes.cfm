<!--- Build a simple ColdFusion XML document. --->
<cfxml variable="girlsXml">
 
<sentence>This is a sentence.  It has <bold>bold</bold> and it has <italics>italics</italics> in it</sentence>
 
</cfxml>
 
<!---
	Dump out the XML Nodes contained within the Girls root
	node. This will give all the child nodes, not just the
	element nodes.
--->
<cfdump
	var="#girlsXml.xmlRoot.xmlNodes#"
	label="xmlRoot.XmlNodes"
	/>