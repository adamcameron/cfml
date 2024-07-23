<!---04/02/2006 02:30:00  --->

<cfset d = createDateTime(2006,4,2,2,30,0)>
<cfoutput>
	raw: #d#<br />
	timeFormat: #timeFormat(d, "HH:MM:SS")#<br />

</cfoutput>

<cfquery name="q" datasource="junk">
	select	*, cast(datepart(hh, testDateTime) as varchar) + ':' + cast(datepart(mi, testDateTime) as varchar) as timeOnly
	from	timeTable
</cfquery>
<cfdump var="#q#">