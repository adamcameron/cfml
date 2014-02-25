<cfscript>
// queryExecute.cfm
numbers = queryExecute("
		SELECT		*
		FROM		words
		WHERE		type = :type
		ORDER BY	id
	",
	{type={value="number", cfsqltype="CF_SQL_VARCHAR"}},
	{datasource="scratch_mssql"}
);
writeDump(numbers);

firstFour = queryExecute("
		SELECT		*
		FROM		numbers
		ORDER BY	id
	",
	{},
	{
		dbtype	= "query",
		maxrows	= 4
	}
);
writeDump(firstFour);

colours = queryExecute("
		SELECT		*
		FROM		words
		WHERE		type = ?
		ORDER BY	id
	",
	[{value="colour"}],
	{
		datasource	= "scratch_mssql"
	}
);
writeDump(colours);
</cfscript>