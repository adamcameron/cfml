<cfparam name="url.iterations" default="1" type="integer">

<cfset iStart = getTickCount()>
<cfloop index="i" from="1" to="#url.iterations#">
	<cfset u =createUuid()>
</cfloop>
<cfset iEnd = getTickCount()>
<cfset iTotal = iEnd - iStart>
<cfoutput>
	Iterations: #URL.iterations#<br />
	Total execution time: #iTotal#ms<br />
	Per iteration: #iTotal\URL.iterations#<br />
</cfoutput>