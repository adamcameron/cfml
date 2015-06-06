
<cfoutput>#variables.testFunc()#</cfoutput>
<cfdump var="#variables#">
<br />
<cftry>
	<cfdump var="#variables.foo()#">
	<cfcatch>Ballocks to foo()</cfcatch>
</cftry>
<br />
<cftry>
	<cfdump var="#variables.bar()#">
	<cfcatch>Ballocks to bar()</cfcatch>
</cftry>
<br />
<cfdump var="#application#" label="application">

<cfset o = createObject("component", "c")>
<cfdump var="#o#" label="c">

<br />
<cftry>
	<cfdump var="#o.bar()#">
	<cfcatch>Ballocks to o.bar()</cfcatch>
</cftry>
<br />
<cftry>
	<cfdump var="#o.foo()#">
	<cfcatch>Ballocks to o.foo()</cfcatch>
</cftry>
