<cfparam name="URL.iterations" type="integer">
<cfset start=getTickCount()>
<cfloop index="i" from="1" to="#URL.iterations#">
	<cfset languageToUse = "Maori">
	<cfset evaluate("application.numbers.in#languageToUse#(number=1)")>

	<cfset languageToUse = "English">
	<cfset evaluate("application.numbers.in#languageToUse#(number=2)")>
</cfloop>
<cfset logit(getTickCount()-start)>