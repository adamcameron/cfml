Steps to Reproduce:
<h1>Control</h1>
<p>This demonstrates that the function works with same-case</p>
<cfset arrayToSearch = [["value"]]>
<cfset arrayToFind = ["value"]>

<cfdump var="#arrayToSearch#" label="arrayToSearch">
<cfdump var="#arrayToFind#" label="arrayToFind">

<cfoutput>
Was it found: #arrayFindNoCase(arrayToSearch, arrayToFind)#<br />
</cfoutput>
<hr />

<cfset arrayToSearch = [new Object("value")]>
<cfset objectToFind = new Object("value")>

<cfdump var="#arrayToSearch#" label="arrayToSearch">
<cfdump var="#objectToFind#" label="objectToFind">

<cfoutput>
Was it found: #arrayFindNoCase(arrayToSearch, objectToFind)#<br />
</cfoutput>
<hr />

<h1>Test</h1>
<p>This demonstrates that the function fails on different casing</p>
<cfset arrayToSearch = [["value"]]>
<cfset arrayToFind = ["VALUE"]>

<cfdump var="#arrayToSearch#" label="arrayToSearch">
<cfdump var="#arrayToFind#" label="arrayToFind">

<cfoutput>
Was it found: #arrayFindNoCase(arrayToSearch, arrayToFind)#<br />
</cfoutput>
<hr />

<cfset arrayToSearch = [new Object("value")]>
<cfset objectToFind = new Object("VALUE")>

<cfdump var="#arrayToSearch#" label="arrayToSearch">
<cfdump var="#objectToFind#" label="objectToFind">

<cfoutput>
Was it found: #arrayFindNoCase(arrayToSearch, objectToFind)#<br />
</cfoutput>
<hr />