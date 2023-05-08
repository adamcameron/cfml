<cfxml variable="x">
	<aaa id="1">
		<bbb id="2" />
	</aaa>
</cfxml>
<cfdump var="#x#" label="Initial state of XML doc">

<cfset a= xmlSearch(x, "//*[@id='2']")>
<cfdump var="#a#" label="Array of search results">
<hr />
<cfset a[1].xmlAttributes["foo"] = "bar">
<cfset a[1].xmlText = "New stuff">
<cfdump var="#a#" label="Updated array of search results">
<cfdump var="#x#" label="And updated state of XML doc">


<cfset a= xmlSearch(x, "//*")>
<cfdump var="#a#" label="Array of all nodes">
