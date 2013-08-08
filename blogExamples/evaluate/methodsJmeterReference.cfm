<cfparam name="URL.iterations" type="integer">
<cfset start=getTickCount()>
<cfloop index="i" from="1" to="#URL.iterations#">
	<cfset languageToUse = "Maori">
	<cfset application.numbers.__staticallyNamedMethod = application.numbers["in#languageToUse#"]>
	<cfset application.numbers.__staticallyNamedMethod(number=1)>

	<cfset languageToUse = "English">
	<cfset application.numbers.__staticallyNamedMethod = application.numbers["in#languageToUse#"]>
	<cfset application.numbers.__staticallyNamedMethod(number=2)>
</cfloop>
<cflog file="#application.applicationname#_reference" text="Elapsed: #getTickCount()-start#ms">