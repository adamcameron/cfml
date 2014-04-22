<cfscript>
	todo = new api.Todo()
	todos = todo.getAllAsQuery()
	writeDump(var=todos);
</cfscript>