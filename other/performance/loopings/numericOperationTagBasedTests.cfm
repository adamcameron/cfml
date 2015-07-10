<cfset sum = 0>
<cfset start = getTickCount()>
<cfloop index="i" from="1" to="#URL.iterations#">
	<cfset sum = sum + i>
</cfloop>
<cfset end = getTickCount()>
<cfoutput>cfloop (general) took #end-start#ms<hr></cfoutput>

<cfset sum = 0>
<cfset start = getTickCount()>
<cfloop index="i" array="#array#">
	<cfset sum = sum + i>
</cfloop>
<cfset end = getTickCount()>
<cfoutput>cfloop (array) took #end-start#ms<hr></cfoutput>