<cfscript>
	bug = entityLoad("Bug", 1, true);
	
	bug = ormExecuteQuery("
		FROM Bug b
		INNER JOIN b.accounts a
		WITH a.id = :id",
		{id=2}
	);
	writeDump(bug);
</cfscript>