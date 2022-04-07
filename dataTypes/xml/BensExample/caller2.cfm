<!---
	Create the Sub XML node parser. We are going to have this
	parser look for both the PROPERTIES and the PRODUCT nodes
	(by passing in a comma delimited list of node names).
--->
<cfset objParser = CreateObject("component", "SubNodeXmlParser2").Init("properties, product", ExpandPath("./products.xml"))>


<!---
	Output the names of all the nodes found. We need to use a
	conditional loop since we don't know how many nodes there
	will be.
--->
<cfflush interval="64">
<cfset iStart = getTickCount()>
<cfset iCount = 0>
<cfloop condition="true">
	<!--- Get the next node. --->
	<cfset VARIABLES.Node = objParser.GetNextNode()>

	<!---
		Check to see if the node was found. If not, then the
		variable, Node, will have been destroyed and will no
		longer exist in its parent scope.
	--->
	<cfif StructKeyExistS( VARIABLES, "Node" )>
		<!--- Output name of node. --->
		<cfoutput>#iCount#: #VARIABLES.Node.XmlName#</cfoutput><br />
		<cfdump var="#VARIABLES.Node#">
		<cfset iCount=iCount+1>
	<cfelse>
		<!--- We are done finding nodes so break out. --->
		<cfbreak>
	</cfif>
</cfloop>
<cfoutput>#iCount#: #getTickCount() - iStart#</cfoutput>