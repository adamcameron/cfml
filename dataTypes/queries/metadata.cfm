<cfquery name="q" datasource="hnzc">
	select	*
	from	dms_tree
</cfquery>

<cfdump var="#q.getMetaData()#">

<cfdump var="#q.getColumn("dtr_left").toArray()#">