<cfset arrayToSearch = ["value"]>
<cfdump var="#arrayToSearch#" label="arrayToSearch">


<h1>Control</h1>
<p>This demonstrates that the function works with same-case</p>
<cfset valueToFind = "value">

<cfdump var="#valueToFind#" label="valueToFind">

<cfoutput>
Was it found: #arrayFindNoCase(arrayToSearch, valueToFind)#<br />
</cfoutput>
<hr />


<h1>Test</h1>
<p>This demonstrates that the function fails on different casing</p>
<cfset valueToFind = "VALUE">

<cfdump var="#valueToFind#" label="valueToFind">

<cfoutput>
Was it found: #arrayFindNoCase(arrayToSearch, valueToFind)#<br />
</cfoutput>
<hr />
