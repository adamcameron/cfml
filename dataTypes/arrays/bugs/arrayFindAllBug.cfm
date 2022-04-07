<cfset arrayToSearch = [{key="value"}]>
<cfset structToFind = {key="VALUE"}>

<cfdump var="#arrayToSearch#" label="arrayToSearch">
<cfdump var="#structToFind#" label="structToFind">

Was it found:
<cfdump var="#arrayFindAll(arrayToSearch, structToFind)#">