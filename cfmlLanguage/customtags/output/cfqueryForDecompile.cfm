<cfscript>
	numbers = queryNew("");
	queryAddColumn(numbers, "id", "integer", [1,2,3,4]);
	queryAddColumn(numbers, "maori", "varchar", ["tahi", "rua", "toru", "wha"]);

	which = randRange(1,4);
</cfscript>


<cfquery dbtype="query" name="number">
	SELECT	*
	FROM	numbers
	WHERE	id = #which#
</cfquery>
<cfoutput>#number.maori#</cfoutput>