<cfdbinfo type="Tables" name="tables">
<cfdump var="#tables#">
<cfloop query="tables">
	<cfif table_type EQ "TABLE">
		<cfdbinfo type="Columns" table="#table_name#" name="columns">
		<cfdump var="#columns#" label="#table_name#">
	</cfif>
</cfloop>