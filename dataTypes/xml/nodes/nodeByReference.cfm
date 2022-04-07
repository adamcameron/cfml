<cfxml variable="x">
	<aaa>
		<bbb foo="bar">Hello World</bbb>
	</aaa>
</cfxml>
<cfdump var="#x#" label="Original doc">

<cfset a = xmlSearch(x, "/aaa/bbb")>
<cfdump var="#a#" label="Original array">

<!--- update the array --->
<cfset a[1].XmlAttributes["foo"] = "No Foo">
<cfset a[1].Xmltext = "Updated">
<cfdump var="#a#" label="Updated array">

<cfdump var="#x#" label="Updated doc?">

<!--- create a reference to a node --->
<cfset n = x.aaa.bbb>
<cfdump var="#n#" label="Original node">

<!--- update the node reference --->
<cfset n.xmlText = "Updated xmlText by node ref">
<cfset n.XmlAttributes["foo"] = "Updated XmlAttributes value by node ref">
<cfdump var="#n#" label="Updated node">
<cfdump var="#x#" label="Updated doc?">

