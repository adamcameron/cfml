<cfquery name="getDateData" datasource="gbc">
	select	label, datetimeCommence
	from	obj_shipschedule
<!--- 	where	datetimeCommence between '2004-6-20' and '2004-6-25' --->
</cfquery>
<cfdump var="#getDateData#">

<cfset startDate = createODBCDate(createDate(2004,3,1))>
<cfset endDate = createODBCDate(createDate(2004,3,31))>
<!---  --->
<cfset startDate = createDate(2004,3,1)>
<cfset endDate = createDate(2004,3,31)>

<cfquery name="QoQ" dbtype="query">
	select	label
	from	getDateData
	where 	datetimeCommence = '#preserveSingleQuotes(startDate)#'
<!--- 	where	datetimeCommence between #preserveSingleQuotes(startDate)# and #preserveSingleQuotes(endDate)# --->
</cfquery>
<cfdump var="#qoq#">