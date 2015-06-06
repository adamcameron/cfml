<cfscript>
// hql.cfm
records = ormExecuteQuery("
	FROM Scratch
	WHERE id > 2
");
writeDump(records);
</cfscript>