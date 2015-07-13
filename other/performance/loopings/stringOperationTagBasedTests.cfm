<!--- stringOperationTagBasedTests.cfm --->

<cfset string = "">
<cfset start = getTickCount()>
<cfloop index="i" from="1" to="#URL.iterations#">
	<cfset string = string & repeatString(chr(64+i) ,10)>
</cfloop>
<cfset end = getTickCount()>
<cfoutput>cfloop (general) took #end-start#ms<hr></cfoutput>

<cfset string = "">
<cfset start = getTickCount()>
<cfloop index="i" array="#array#">
	<cfset string = string & repeatString(chr(64+i) ,10)>
</cfloop>
<cfset end = getTickCount()>
<cfoutput>cfloop (array) took #end-start#ms<hr></cfoutput>