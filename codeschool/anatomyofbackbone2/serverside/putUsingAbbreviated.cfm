<cfscript>
	param name="URL.i" type="numeric";
	param name="URL.d";
	param name="URL.s";

	o = {
		id			= URL.i,
		description	= URL.d,
		status		= URL.s
	};
	e = new api.Todo(argumentCollection=o);
	entitySave(e);

	all = entityLoad("Todo");
	writeDump(var=all);
</cfscript>