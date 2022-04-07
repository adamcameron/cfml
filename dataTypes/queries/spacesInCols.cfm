<cfquery name="q" datasource="adam_junk">
	select	*
	from	table1
</cfquery>


<cfdump var="#q#">

<cfoutput>
#q["col with spaces"][1]#
</cfoutput>