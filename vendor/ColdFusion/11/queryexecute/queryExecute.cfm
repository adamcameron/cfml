<cfscript>
// queryExecute.cfm
numbers = queryExecute("
	SELECT		*
	FROM		words
	ORDER BY	id
");
writeDump(numbers);
</cfscript>