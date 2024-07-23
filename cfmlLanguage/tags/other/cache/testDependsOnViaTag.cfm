<!--- testDependsOn.cfm --->

<h3>First pass</h3>
<cfset foo = timeFormat(now(), "HHMMSS")>
<cfset foo = "same">
<cfcache dependsOn="foo" timespan="#createTimespan(0,0,0,1)#">
	<cfoutput>getTickCount(): #getTickCount()#<br></cfoutput>
	<cfoutput>foo: #foo#<br></cfoutput>
</cfcache>
<cfset sleep(200)>

<h3>Second pass</h3>
<cfset foo = timeFormat(now(), "HHMMSS")>
<cfset foo = "same">
<cfcache dependsOn="foo" timespan="#createTimespan(0,0,0,1)#">
	<cfoutput>getTickCount(): #getTickCount()#<br></cfoutput>
	<cfoutput>foo: #foo#<br></cfoutput>
</cfcache>
<cfset sleep(1000)>

<h3>Third pass</h3>
<cfset foo = timeFormat(now(), "HHMMSS")>
<cfset foo = "same">

<cfcache dependsOn="foo" timespan="#createTimespan(0,0,0,1)#">
	<cfoutput>getTickCount(): #getTickCount()#<br></cfoutput>
	<cfoutput>foo: #foo#<br></cfoutput>
</cfcache>

<h3>Fourth pass</h3>
<cfset foo = "completely different">
<cfcache dependsOn="foo" timespan="#createTimespan(0,0,0,1)#">
	<cfoutput>getTickCount(): #getTickCount()#<br></cfoutput>
	<cfoutput>foo: #foo#<br></cfoutput>
</cfcache>