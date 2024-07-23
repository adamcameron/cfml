<cfset o = createObject("component", "c")>

Set first:<br />
<cfset o.setMyString(myString="marmoset")>
<cfdump var="#o.getvariables()#">
<cfoutput>#o.processMyString()#</cfoutput>
<hr />

Set in getMyString()<br />
<cfset o = createObject("component", "c")>
<cfdump var="#o.getvariables()#">
<cfoutput>#o.processMyString(myString="pangolin")#</cfoutput>
<hr />

Not set<br />
<cfset o = createObject("component", "c")>
<cftry>
	<cfdump var="#o.getvariables()#">
	<cfoutput>#o.processMyString()#</cfoutput>
	<cfcatch>
		It broke
		<cfdump var="#cfcatch#">
	</cfcatch>
</cftry>
