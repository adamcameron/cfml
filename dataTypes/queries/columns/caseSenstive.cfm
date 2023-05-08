<cfquery name="q" datasource="intranet" result="st">
select  'uppercase' as "CASETEST",
        'lowercase' as "casetest",
        'UpperCamelCase' as "CaseTest",
        'lowerCamelCase' as "caseTest"
from dual
</cfquery>
<cfset stMetadata = getMetadata(q)>
<cfdump var="#variables#">
<cfloop index="i" from="1" to="#arrayLen(stMetadata)#">
	<cfoutput>#stMetadata[i].name#: #q["#stMetadata[i].name#"][1]#<br /></cfoutput>
</cfloop>

<cfdump var="#q.getColumnCount()#">
<cfdump var="#q.getColumn(1)#">