<cfscript>
	o = createObject("java", "ByRef");
	original = "lowercase";
	updated = o.change(original);

	writeDump(variables);
</cfscript>