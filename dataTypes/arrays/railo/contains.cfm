<cfprocessingdirective pageencoding="utf-8">
<cfset daysOfWeek = array("Rāhina", "Rātū", "Rāapa", "Rāpare", "Rāmere", "Rāhoroi", "Rātapu")>
<cfoutput>
	contains("Rāhina"): #daysOfWeek.contains("Rāhina")#<br />
	contains("RĀHINA"): #daysOfWeek.contains("RĀHINA")#<br />
	<hr />
	containsNoCase("Rātū"): #daysOfWeek.containsNoCase("Rātū")#<br />
	containsNoCase("RĀTŪ"): #daysOfWeek.containsNoCase("RĀTŪ")#<br />
	<hr />
	find("Rāapa"): #daysOfWeek.find("Rāapa")#<br />
	find("RĀAPA"): #daysOfWeek.find("RĀAPA")#<br />
	<hr />
	findNoCase("Rāpare"): #daysOfWeek.findNoCase("Rāpare")#<br />
	findNoCase("RĀPARE"): #daysOfWeek.findNoCase("RĀPARE")#<br />
	<hr />
</cfoutput>