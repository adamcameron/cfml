<cfquery name="qry" datasource="scratch_mssql">
    SELECT getDate() AS DateTimeVariable
</cfquery>

<cfoutput>
#qry.DateTimeVariable#<br>
#qry.DateTimeVariable[1].getClass().getName()#<br>
</cfoutput>
<cfloop query="qry">
	<cfoutput>
	#DateTimeVariable#<br>
	#DateTimeVariable[1].getClass().getName()#<br>
	</cfoutput>
</cfloop>