<cfsetting requesttimeout="100000" showdebugoutput="no">
<cfset dsn = "insignia_s4_mx">

<cfparam name="URL.run" default="1">

<cffunction name="structBuild">
	<cfreturn arguments>
</cffunction>

<cfset resultStruct = structBuild(all=structBuild(total=0,average=0), top=structBuild(total=0,average=0), max=structBuild(total=0,average=0),_iterations=url.run)>

<cfloop index="i" from="1" to="#URL.run#">
	<cfset start=getTickCount()>
	<cfquery name="test" datasource="#dsn#">
	select	stat_id
	from stats
	where stat_id = #randrange(1,65536)#
	or 1=1
	</cfquery>
	<cfset resultStruct.all.total = resultStruct.all.total + getTickCount()-start>
	<cfset resultStruct.all.average = resultStruct.all.total / i>
	
	
	<cfset start=getTickCount()>
	<cfquery name="test" datasource="#dsn#">
	select	top 10000 stat_id
	from stats
	where stat_id = #randrange(1,65536)#
	or 1=1
	</cfquery>
	<cfset resultStruct.top.total = resultStruct.top.total + getTickCount()-start>
	<cfset resultStruct.top.average = resultStruct.top.total / i>
	
	
	<cfset start=getTickCount()>
	<cfquery name="test" datasource="#dsn#" maxrows="10000">
	select	stat_id
	from stats
	where stat_id = #randrange(1,65536)#
	or 1=1
	</cfquery>
	<cfset resultStruct.max.total = resultStruct.max.total + getTickCount()-start>
	<cfset resultStruct.max.average = resultStruct.max.total / i>
</cfloop>

<cfdump var="#resultStruct#">
