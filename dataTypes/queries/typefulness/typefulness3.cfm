<cfquery name="getNumericData" datasource="gbc">
	select	circuit_position	<!--- note: [circuit_position] [int] NULL --->
	from	circuits

	union all
	
	select	circuit_position	<!--- note: [circuit_position] [int] NULL --->
	from	circuits

	union all
	
	select	circuit_position	<!--- note: [circuit_position] [int] NULL --->
	from	circuits

</cfquery>

<cfdump var="#getNumericData#">
<cfdump var="#getNumericData.getColumnList()#">
<cfdump var="#getNumericData.getMetaData().getColumnTypeName(1)#">


<cfloop index="i" from="1" to="51">
<cfset querySetCell(getNumericData, "circuit_position", getNumericData.clearWarnings(), i)><!--- that's jsut the most conveneient way I could find of putting a NULL in there --->
</cfloop>



<cfdump var="#getNumericData.getMetaData().getColumnTypeName(1)#">
<cfquery name="QoQ" dbtype="query">
	select		*
	from		getNumericData
<!--- 	where		circuit_position is not null --->
	order by	circuit_position
</cfquery>
<cfdump var="#QoQ#">