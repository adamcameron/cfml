<cfquery name="q1" datasource="scratch" debug="true">
	select	*
	from	tbl_colour
</cfquery>
<cfdump var="#q1#">

<cfquery name="q2" datasource="scratch" debug="false">
	select	*
	from	tbl_avg
</cfquery>
<cfdump var="#q2#">


<cfquery name="q3" datasource="scratch">
	select	*
	from	tbl_person
</cfquery>
<cfdump var="#q3#">