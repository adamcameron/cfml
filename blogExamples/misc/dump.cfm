<cfprocessingdirective pageencoding="utf-8">
<cfset daysOfWeek = ["Rāhina", "Rātū", "Rāapa", "Rāpare", "Rāmere", "Rāhoroi", "Rātapu"]>

<cfsavecontent variable="output">
<cfdump var="#daysOfWeek#">
</cfsavecontent>
<cfoutput>
	#len(output)#<br />
	#output#
</cfoutput>


