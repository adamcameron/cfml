<cfscript>
	param name="URL.description";
	param name="URL.status";

	todo = new api.Todo(description=URL.description,status=URL.status)
	entitySave(todo)
</cfscript>