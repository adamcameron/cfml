<cfparam name="URL.iterations" type="integer">
<cfset start=getTickCount()>
<cfloop index="i" from="1" to="#URL.iterations#">
	<cfset languageToUse = "Maori">
	<cfinvoke component="#application.numbers#" method="in#languageToUse#" number="1">

	<cfset languageToUse = "English">
	<cfinvoke component="#application.numbers#" method="in#languageToUse#" number="2">
</cfloop>
<cfset logit(getTickCount()-start)>