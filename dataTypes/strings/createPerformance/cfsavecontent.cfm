<!---cfsavecontent.cfm --->
<cfset startTime = getTickCount()>
<cfset i=1>
<cfsetting enablecfoutputonly="true">
<cfsavecontent variable="s">
	<cfloop condition="i LE stringLength"><!--- doing it this way to best emulate the for() loops in the other examples --->
		<cfoutput>X</cfoutput>
		<cfset i=i+1>
	</cfloop>
</cfsavecontent>
<cfsetting enablecfoutputonly="false">
<cfset endTime = getTickCount()>