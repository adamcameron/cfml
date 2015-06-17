<cfquery name="q" datasource="intranet" result="st">
	select	c.uuid as z, c.circuit_title as y, c.page_id as x
	from 	circuits c
	where	rownum <= 10
</cfquery>
<cfdump var="#q#" label="q">
<cfdump var="#st#" label="st">
<cfdump var="#q.columnList#" label="q.columnList">
<cfdump var="#q.getColumnList()#" label="q.getColumnList()">


<cfquery name="q2" dbtype="query">
	select	*
	from 	q
</cfquery>
<cfdump var="#q2#" label="q2">
<cfdump var="#st#" label="st">
<cfdump var="#q2.columnList#" label="q2.columnList">
<cfdump var="#q2.getColumnList()#" label="q2.getColumnList()">

<cfquery name="q3" datasource="intranet" result="st">
	select	*
	from 	circuits c
	where	rownum <= 10
</cfquery>
<cfdump var="#q3#" label="q3">
<cfdump var="#st#" label="st">
<cfdump var="#q3.columnList#" label="q3.columnList">
<cfdump var="#q3.getColumnList()#" label="q3.getColumnList()">