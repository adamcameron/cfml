<cfscript>
numbers = queryExecute("
	SELECT	en AS english, mi AS maori
	FROM	colours
	WHERE	id	BETWEEN	:low AND :high
", {low=2,high=3});
writeDump(var=numbers);
</cfscript>