<cfdbinfo datasource="scratch" type="Tables" name="qTables">
<cfquery name="qTables" dbtype="query">
	select		table_name
	from		qTables
	where		table_type = 'TABLE'
	order by	table_name
</cfquery>
<cfdump var="#qTables#"> 