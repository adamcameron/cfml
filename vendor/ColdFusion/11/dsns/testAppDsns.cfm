<cfset colours = queryExecute("SELECT * FROM colours ORDER BY id")>
<cfset numbers = queryExecute("SELECT * FROM numbers ORDER BY id", [], {datasource="scratch_embedded_app"})>
<cfdump var="#[colours,numbers]#">