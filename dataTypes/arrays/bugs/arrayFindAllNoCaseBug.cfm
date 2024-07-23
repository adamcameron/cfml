<h1>Control</h1>
<p>This demonstrates that the function works with same-case</p>
<cfset arrayToSearch = [["value"]]>
<cfset arrayToFind = ["value"]>

<cfdump var="#arrayToSearch#" label="arrayToSearch">
<cfdump var="#arrayToFind#" label="arrayToFind">

Was it found:
<cfdump var="#arrayFindAllNoCase(arrayToSearch, arrayToFind)#">
<br />

<cfset arrayToSearch = [new Object("value")]>
<cfset objectToFind = new Object("value")>

<cfdump var="#arrayToSearch#" label="arrayToSearch">
<cfdump var="#objectToFind#" label="objectToFind">

Was it found:
<cfdump var="#arrayFindAllNoCase(arrayToSearch, objectToFind)#">
<br />
<hr />

<h1>Test</h1>
<p>This demonstrates that the function fails on different casing</p>
<cfset arrayToSearch = [["value"]]>
<cfset arrayToFind = ["VALUE"]>

<cfdump var="#arrayToSearch#" label="arrayToSearch">
<cfdump var="#arrayToFind#" label="arrayToFind">

Was it found:
<cfdump var="#arrayFindAllNoCase(arrayToSearch, arrayToFind)#">
<br />

<cfset arrayToSearch = [new Object("value")]>
<cfset objectToFind = new Object("VALUE")>

<cfdump var="#arrayToSearch#" label="arrayToSearch">
<cfdump var="#objectToFind#" label="objectToFind">

Was it found:
<cfdump var="#arrayFindAllNoCase(arrayToSearch, ObjectToFind)#">
<br />
