<cfscript>
numbers = queryExecute("
	SELECT id AS value, en AS english, mi AS maori
	FROM numbers
	WHERE id > 5
	ORDER BY id DESC
");
writeDump(numbers);
</cfscript>