<cfset arrayToSearch = [["value"]]>
<cfdump var="#arrayToSearch#" label="arrayToSearch">


<h1>Control</h1>
<p>This demonstrates that the function works with same-case</p>
<cfset arrayToFind = ["value"]>

<cfdump var="#arrayToFind#" label="arrayToFind">

<cfoutput>
Was it found: #arrayFindNoCase(arrayToSearch, arrayToFind)#<br />
</cfoutput>
<hr />


<h1>Test</h1>
<p>This demonstrates that the function fails on different casing</p>
<cfset arrayToFind = ["VALUE"]>

<cfdump var="#arrayToFind#" label="arrayToFind">

<cfoutput>
Was it found: #arrayFindNoCase(arrayToSearch, arrayToFind)#<br />
</cfoutput>
<hr />
