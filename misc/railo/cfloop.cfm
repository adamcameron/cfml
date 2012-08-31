<cfprocessingdirective pageencoding="utf-8">
<cfset daysOfWeek = ["Rāhina","Rātū","Rāapa","Rāpare","Rāmere","Rāhoroi","Rātapu"]>
<cfloop array="#daysOfWeek#" index="index" item="day">
	<cfoutput>#index#: #day#<br /></cfoutput>
</cfloop>
<hr />

<cfset daysOfWeek = {monday="Rāhina", tuesday="Rātū", wednesday="Rāapa", thursday="Rāpare", friday="Rāmere", saturday="Rāhoroi", sunday="Rātapu"}>
<cfloop collection="#daysOfWeek#" index="index" item="day">
	<cfoutput>#index#: #day#<br /></cfoutput>
</cfloop>
<hr />

<cfset daysOfWeek = "Rāhina,Rātū,Rāapa,Rāpare,Rāmere,Rāhoroi,Rātapu">
<cfloop list="#daysOfWeek#" index="index" item="day">
	<cfoutput>#index#: #day#<br /></cfoutput>
</cfloop>
<hr />
